#!/usr/bin/env python3
import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open('rb') as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def main() -> None:
    ap = argparse.ArgumentParser(description='Emit dataset manifest/stats for nndecomp JSONL.')
    ap.add_argument('--in-jsonl', required=True)
    ap.add_argument('--out-json', required=True)
    args = ap.parse_args()

    inp = Path(args.in_jsonl)
    stage = Counter()
    comp = Counter()
    opt = Counter()
    sources = set()
    rows = 0

    with inp.open(encoding='utf-8') as f:
        for ln in f:
            ln = ln.strip()
            if not ln:
                continue
            row = json.loads(ln)
            rows += 1
            meta = row.get('meta') or {}
            st = str(meta.get('stage') or 'none')
            cp = str(meta.get('compiler') or 'unknown')
            fl = str(meta.get('flags') or '')
            src = str(meta.get('source') or '')
            stage[st] += 1
            comp[cp] += 1
            if src:
                sources.add(src)
            if '/O' in fl:
                i = fl.find('/O')
                j = i + 2
                while j < len(fl) and fl[j].isalpha():
                    j += 1
                opt[fl[i:j].upper()] += 1
            else:
                opt['OPTUNK'] += 1

    out = {
        'path': str(inp),
        'sha256': sha256_file(inp),
        'rows': rows,
        'unique_sources': len(sources),
        'by_stage': dict(sorted(stage.items())),
        'by_compiler': dict(sorted(comp.items())),
        'by_opt': dict(sorted(opt.items())),
    }

    op = Path(args.out_json)
    op.parent.mkdir(parents=True, exist_ok=True)
    op.write_text(json.dumps(out, indent=2, ensure_ascii=False) + '\n', encoding='utf-8')
    print(json.dumps({'rows': rows, 'manifest': str(op)}, ensure_ascii=False))


if __name__ == '__main__':
    main()
