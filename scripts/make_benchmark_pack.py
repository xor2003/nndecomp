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


def main():
    ap = argparse.ArgumentParser(description='Create fixed benchmark pack stratified by compiler/opt/lang.')
    ap.add_argument('--in-jsonl', required=True)
    ap.add_argument('--out-jsonl', required=True)
    ap.add_argument('--out-index', required=True)
    ap.add_argument('--stage-filter', choices=['all', 'readable', 'skeleton'], default='readable')
    ap.add_argument('--quality', default='high')
    ap.add_argument('--per-bucket', type=int, default=50)
    ap.add_argument('--seed', type=int, default=1337)
    args = ap.parse_args()

    buckets = defaultdict(list)
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
            comp = str(meta.get('compiler') or 'unknown')
            flags = str(meta.get('flags') or '')
            opt = opt_bucket(flags)
            src = str(meta.get('source') or '')
            lang = 'cpp' if src.lower().endswith('.cpp') else 'c'
            key = f'{comp}:{opt}:{lang}'
            buckets[key].append(row)

    selected = []
    index = []
    for k in sorted(buckets):
        picked = stable_pick(buckets[k], args.per_bucket, args.seed)
        for r in picked:
            selected.append(r)
            m = r.get('meta') or {}
            index.append({'bucket': k, 'source': m.get('source'), 'function': m.get('function'), 'flags': m.get('flags')})

    Path(args.out_jsonl).parent.mkdir(parents=True, exist_ok=True)
    with Path(args.out_jsonl).open('w', encoding='utf-8') as w:
        for r in selected:
            w.write(json.dumps(r, ensure_ascii=False) + '\n')
    Path(args.out_index).write_text(json.dumps(index, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps({'rows': len(selected), 'buckets': {k: len(v) for k, v in buckets.items()}}))


if __name__ == '__main__':
    main()

