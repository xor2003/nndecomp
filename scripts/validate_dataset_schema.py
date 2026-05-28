#!/usr/bin/env python3
import argparse
import json
from pathlib import Path


REQUIRED_MSG_ROLES = ('system', 'user', 'assistant')


def validate_row(row: dict, idx: int) -> list[str]:
    errs = []
    if not isinstance(row, dict):
        return [f'row {idx}: not an object']
    msgs = row.get('messages')
    if not isinstance(msgs, list) or len(msgs) < 3:
        errs.append(f'row {idx}: messages must be list with >=3 items')
        return errs
    roles = []
    for i, m in enumerate(msgs):
        if not isinstance(m, dict):
            errs.append(f'row {idx}: messages[{i}] not object')
            continue
        r = m.get('role')
        c = m.get('content')
        roles.append(r)
        if r not in REQUIRED_MSG_ROLES:
            errs.append(f'row {idx}: bad role {r!r}')
        if not isinstance(c, str) or not c.strip():
            errs.append(f'row {idx}: messages[{i}].content empty/non-string')
    if roles[:3] != list(REQUIRED_MSG_ROLES):
        errs.append(f'row {idx}: first 3 roles must be {REQUIRED_MSG_ROLES}, got {roles[:3]}')

    meta = row.get('meta')
    if meta is not None:
        if not isinstance(meta, dict):
            errs.append(f'row {idx}: meta not object')
        else:
            for k in ('compiler', 'flags', 'source'):
                if k in meta and not isinstance(meta[k], str):
                    errs.append(f'row {idx}: meta.{k} must be string')
            if 'stage' in meta and meta['stage'] not in ('skeleton', 'readable'):
                errs.append(f'row {idx}: meta.stage invalid ({meta["stage"]!r})')
    return errs


def main():
    ap = argparse.ArgumentParser(description='Validate nndecomp dataset JSONL schema.')
    ap.add_argument('--in-jsonl', required=True)
    ap.add_argument('--max-errors', type=int, default=100)
    args = ap.parse_args()

    path = Path(args.in_jsonl)
    errs = []
    rows = 0
    with path.open(encoding='utf-8') as f:
        for i, ln in enumerate(f, start=1):
            ln = ln.strip()
            if not ln:
                continue
            rows += 1
            try:
                row = json.loads(ln)
            except Exception as e:
                errs.append(f'row {i}: invalid json: {e}')
                if len(errs) >= args.max_errors:
                    break
                continue
            row_errs = validate_row(row, i)
            errs.extend(row_errs)
            if len(errs) >= args.max_errors:
                break

    print(json.dumps({'rows': rows, 'errors': len(errs), 'ok': len(errs) == 0}, ensure_ascii=False))
    if errs:
        for e in errs[:args.max_errors]:
            print(e)
        raise SystemExit(1)


if __name__ == '__main__':
    main()

