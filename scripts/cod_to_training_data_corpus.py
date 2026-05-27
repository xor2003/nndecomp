#!/usr/bin/env python3
import argparse
import json
from pathlib import Path


def clean_text(s: str) -> str:
    return s.replace('\r\n', '\n').replace('\r', '\n')


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--report', default='artifacts/corpus_cod_build_report.json')
    ap.add_argument('--out', default='artifacts/corpus_cod_training.jsonl')
    ap.add_argument('--min-cod-bytes', type=int, default=64)
    args = ap.parse_args()

    report = json.loads(Path(args.report).read_text(encoding='utf-8'))
    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)

    count = 0
    with out.open('w', encoding='utf-8') as w:
        for rec in report.get('results', []):
            if not rec.get('success'):
                continue
            src = Path('/home/xor/nndecomp') / rec['file']
            cod = src.with_suffix('.COD')
            if not cod.exists() or cod.stat().st_size < args.min_cod_bytes:
                continue
            source = clean_text(src.read_text(errors='replace'))
            listing = clean_text(cod.read_text(errors='replace'))
            ex = {
                'id': rec['file'],
                'messages': [
                    {'role': 'system', 'content': 'You translate compiler listings/assembly into C/C++ source.'},
                    {'role': 'user', 'content': f'Decompile this listing to source code:\n\n{listing}'},
                    {'role': 'assistant', 'content': source},
                ],
                'meta': {
                    'compiler': rec.get('compiler'),
                    'source': rec['file'],
                    'cod': rec['file'].rsplit('.', 1)[0] + '.COD',
                },
            }
            w.write(json.dumps(ex, ensure_ascii=True) + '\n')
            count += 1
    print(f'Wrote {count} examples to {out}')


if __name__ == '__main__':
    main()
