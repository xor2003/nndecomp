#!/usr/bin/env python3
import argparse
import hashlib
import json
from pathlib import Path


def family_key(row: dict) -> str:
    meta = row.get('meta') or {}
    src = str(meta.get('source') or '')
    if not src:
        return 'unknown'
    parts = src.split('/')
    if len(parts) >= 3:
        return '/'.join(parts[:3])  # e.g. bcex/sopsw/BMBLIB.C
    return src


def stable_shuffle_keys(keys, seed: int):
    return sorted(keys, key=lambda k: hashlib.md5(f'{seed}:{k}'.encode('utf-8')).hexdigest())


def main():
    ap = argparse.ArgumentParser(description='Leak-safe split by source family key.')
    ap.add_argument('--in-jsonl', required=True)
    ap.add_argument('--out-train', required=True)
    ap.add_argument('--out-val', required=True)
    ap.add_argument('--out-test', required=True)
    ap.add_argument('--train-ratio', type=float, default=0.9)
    ap.add_argument('--val-ratio', type=float, default=0.05)
    ap.add_argument('--seed', type=int, default=1337)
    ap.add_argument('--stage-filter', choices=['all', 'readable', 'skeleton'], default='all')
    args = ap.parse_args()

    if args.train_ratio <= 0 or args.val_ratio < 0 or args.train_ratio + args.val_ratio >= 1:
        raise SystemExit('bad ratios')

    inp = Path(args.in_jsonl)
    Path(args.out_train).parent.mkdir(parents=True, exist_ok=True)
    Path(args.out_val).parent.mkdir(parents=True, exist_ok=True)
    Path(args.out_test).parent.mkdir(parents=True, exist_ok=True)

    # First pass: collect rows and families.
    rows_all = []
    fam_counts = {}
    with inp.open(encoding='utf-8') as f:
        for ln in f:
            if not ln.strip():
                continue
            row = json.loads(ln)
            if args.stage_filter != 'all':
                stage = str((row.get('meta') or {}).get('stage') or '')
                if stage and stage != args.stage_filter:
                    continue
            key = family_key(row)
            fam_counts[key] = fam_counts.get(key, 0) + 1
            rows_all.append((key, row))

    fams = stable_shuffle_keys(list(fam_counts.keys()), args.seed)
    nf = len(fams)
    n_train = int(round(nf * args.train_ratio))
    n_val = int(round(nf * args.val_ratio))
    n_test = nf - n_train - n_val
    if nf >= 3:
        if n_val == 0:
            n_val = 1
        if n_test == 0:
            n_test = 1
        n_train = max(1, nf - n_val - n_test)
    fam_bucket = {}
    for i, k in enumerate(fams):
        if i < n_train:
            fam_bucket[k] = 'train'
        elif i < n_train + n_val:
            fam_bucket[k] = 'val'
        else:
            fam_bucket[k] = 'test'

    c = {'train': 0, 'val': 0, 'test': 0}
    rows = len(rows_all)
    with inp.open(encoding='utf-8') as f, \
         Path(args.out_train).open('w', encoding='utf-8') as wtr, \
         Path(args.out_val).open('w', encoding='utf-8') as wv, \
         Path(args.out_test).open('w', encoding='utf-8') as wt:
        for key, row in rows_all:
            b = fam_bucket[key]
            if b == 'train':
                wtr.write(json.dumps(row, ensure_ascii=False) + '\n')
            elif b == 'val':
                wv.write(json.dumps(row, ensure_ascii=False) + '\n')
            else:
                wt.write(json.dumps(row, ensure_ascii=False) + '\n')
            c[b] += 1

    print(json.dumps({'rows': rows, 'counts': c, 'families': len(fam_bucket)}))


if __name__ == '__main__':
    main()
