#!/usr/bin/env python3
import argparse
import hashlib
import json
from collections import defaultdict
from pathlib import Path


def opt_bucket(flags: str) -> str:
    import re
    m = re.search(r'/O([A-Za-z]+)', flags or '')
    return ('O' + m.group(1)).upper() if m else 'OPTUNK'


def stable_pick(rows, k, seed):
    rows = sorted(rows, key=lambda r: hashlib.md5((str(seed) + json.dumps(r, sort_keys=True, ensure_ascii=False)).encode('utf-8')).hexdigest())
    return rows[:k]


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open('rb') as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def stable_id(meta: dict, row: dict) -> str:
    src = str(meta.get('source') or '')
    fn = str(meta.get('function') or '')
    flags = str(meta.get('flags') or '')
    comp = str(meta.get('compiler') or '')
    row_md5 = hashlib.md5(json.dumps(row, sort_keys=True, ensure_ascii=False).encode('utf-8')).hexdigest()
    sig = f'{src}::{fn}::{comp}::{flags}::{row_md5}'
    return hashlib.md5(sig.encode('utf-8')).hexdigest()[:16]


def main():
    ap = argparse.ArgumentParser(description='Create fixed benchmark pack stratified by compiler/opt/lang.')
    ap.add_argument('--in-jsonl', required=True)
    ap.add_argument('--out-jsonl', required=True)
    ap.add_argument('--out-index', required=True)
    ap.add_argument('--out-manifest', default='', help='Optional manifest JSON path with params/checksums/stable IDs.')
    ap.add_argument('--stage-filter', choices=['all', 'readable', 'skeleton'], default='readable')
    ap.add_argument('--quality', default='high')
    ap.add_argument('--per-bucket', type=int, default=50)
    ap.add_argument('--mode', choices=['bucket', 'opt-balanced'], default='bucket')
    ap.add_argument('--per-opt', type=int, default=0, help='Rows per opt bucket when --mode=opt-balanced.')
    ap.add_argument('--dedup-by', choices=['none', 'norm_hash', 'raw_hash', 'source_function'], default='none')
    ap.add_argument('--seed', type=int, default=1337)
    args = ap.parse_args()

    buckets = defaultdict(list)
    seen = set()
    dedup_dropped = 0
    with Path(args.in_jsonl).open(encoding='utf-8') as f:
        for ln in f:
            if not ln.strip():
                continue
            row = json.loads(ln)
            meta = row.get('meta') or {}
            stage = str(meta.get('stage') or '')
            if args.stage_filter != 'all' and stage and stage != args.stage_filter:
                continue
            if args.quality and str(meta.get('quality') or '') != args.quality:
                continue
            if args.dedup_by != 'none':
                if args.dedup_by in ('norm_hash', 'raw_hash'):
                    dk = str(meta.get(args.dedup_by) or '')
                else:
                    dk = f"{str(meta.get('source') or '')}::{str(meta.get('function') or '')}"
                if dk:
                    if dk in seen:
                        dedup_dropped += 1
                        continue
                    seen.add(dk)
            comp = str(meta.get('compiler') or 'unknown')
            flags = str(meta.get('flags') or '')
            opt = opt_bucket(flags)
            src = str(meta.get('source') or '')
            lang = 'cpp' if src.lower().endswith('.cpp') else 'c'
            key = f'{comp}:{opt}:{lang}'
            buckets[key].append(row)

    selected = []
    index = []
    if args.mode == 'bucket':
        for k in sorted(buckets):
            picked = stable_pick(buckets[k], args.per_bucket, args.seed)
            for r in picked:
                selected.append(r)
                m = r.get('meta') or {}
                index.append({'bucket': k, 'source': m.get('source'), 'function': m.get('function'), 'flags': m.get('flags')})
    else:
        # Keep benchmark balanced by optimization bucket regardless of compiler/lang mix.
        by_opt = defaultdict(list)
        for k, rows in buckets.items():
            _comp, opt, _lang = k.split(':', 2)
            by_opt[opt].extend(rows)
        per_opt = args.per_opt if args.per_opt > 0 else args.per_bucket
        for opt in sorted(by_opt):
            picked = stable_pick(by_opt[opt], per_opt, args.seed)
            for r in picked:
                selected.append(r)
                m = r.get('meta') or {}
                src = str(m.get('source') or '')
                lang = 'cpp' if src.lower().endswith('.cpp') else 'c'
                comp = str(m.get('compiler') or 'unknown')
                index.append({
                    'bucket': f'{comp}:{opt}:{lang}',
                    'opt_bucket': opt,
                    'source': m.get('source'),
                    'function': m.get('function'),
                    'flags': m.get('flags'),
                })

    Path(args.out_jsonl).parent.mkdir(parents=True, exist_ok=True)
    out_jsonl = Path(args.out_jsonl)
    out_index = Path(args.out_index)
    with out_jsonl.open('w', encoding='utf-8') as w:
        for r in selected:
            w.write(json.dumps(r, ensure_ascii=False) + '\n')
    # attach frozen stable IDs in index
    idx_rows = []
    for i, it in enumerate(index):
        # i aligns with selected order
        m = selected[i].get('meta') or {}
        idx_rows.append({**it, 'stable_id': stable_id(m, selected[i])})
    out_index.write_text(json.dumps(idx_rows, ensure_ascii=False, indent=2), encoding='utf-8')
    if args.out_manifest:
        man = {
            'params': {
                'stage_filter': args.stage_filter,
                'quality': args.quality,
                'per_bucket': args.per_bucket,
                'mode': args.mode,
                'per_opt': args.per_opt,
                'dedup_by': args.dedup_by,
                'seed': args.seed,
            },
            'input': str(args.in_jsonl),
            'output_jsonl': str(out_jsonl),
            'output_index': str(out_index),
            'rows': len(selected),
            'input_sha256': sha256_file(Path(args.in_jsonl)),
            'output_jsonl_sha256': sha256_file(out_jsonl),
            'output_index_sha256': sha256_file(out_index),
            'stable_ids': [x['stable_id'] for x in idx_rows],
        }
        op = Path(args.out_manifest)
        op.parent.mkdir(parents=True, exist_ok=True)
        op.write_text(json.dumps(man, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps({
        'rows': len(selected),
        'mode': args.mode,
        'dedup_by': args.dedup_by,
        'dedup_dropped': dedup_dropped,
        'buckets': {k: len(v) for k, v in buckets.items()},
    }))


if __name__ == '__main__':
    main()
