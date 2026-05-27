#!/usr/bin/env python3
import argparse, json
from pathlib import Path

def clean(s):
    return s.replace('\r\n','\n').replace('\r','\n')

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--dirs', nargs='+', default=['msex','bcex','tcex'])
    ap.add_argument('--out', default='artifacts/corpus_cod_training_fs.jsonl')
    ap.add_argument('--min-cod-bytes', type=int, default=64)
    args=ap.parse_args()
    out=Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    count=0
    with out.open('w',encoding='utf-8') as w:
        for d in args.dirs:
            for src in Path(d).rglob('*'):
                if src.suffix.upper() not in {'.C','.CPP'}:
                    continue
                cod=src.with_suffix('.COD')
                if not cod.exists() or cod.stat().st_size < args.min_cod_bytes:
                    continue
                ex={
                    'id': src.as_posix(),
                    'messages':[
                        {'role':'system','content':'Translate legacy compiler listings/asm into C/C++.'},
                        {'role':'user','content':'Recover source from this listing:\n\n'+clean(cod.read_text(errors='replace'))},
                        {'role':'assistant','content':clean(src.read_text(errors='replace'))},
                    ],
                    'meta':{'source':src.as_posix(),'cod':cod.as_posix()}
                }
                w.write(json.dumps(ex, ensure_ascii=True)+'\n')
                count+=1
    print('examples',count,'out',out)

if __name__=='__main__':
    main()
