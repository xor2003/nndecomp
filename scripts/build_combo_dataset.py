#!/usr/bin/env python3
import argparse
import concurrent.futures
import hashlib
import itertools
import json
import os
import re
import subprocess
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
KVIKDOS = Path('/home/xor/kvikdos/kvikdos')

TOOLCHAINS = {
    'msc61': {'root': REPO_ROOT / 'msc61', 'kind': 'msc', 'exe': 'CL.EXE'},
    'msc6': {'root': REPO_ROOT / 'msc60', 'kind': 'msc', 'exe': 'CL.EXE'},
    'msc5': {'root': REPO_ROOT / 'msc5', 'kind': 'msc', 'exe': 'CL.EXE'},
    'msc4': {'root': REPO_ROOT / 'msc4', 'kind': 'msc', 'exe': 'CL.EXE'},
}

C_KEYWORDS = {
    'auto','break','case','char','const','continue','default','do','double','else','enum','extern',
    'float','for','goto','if','int','long','register','return','short','signed','sizeof','static',
    'struct','switch','typedef','union','unsigned','void','volatile','while','near','far','huge','interrupt'
}

MSC_GROUPS = {
    'opt_base': ['/Od', '/Os', '/Ot', '/Ox'],
    'opt_toggles': ['/Ol', '/On', '/Or', '/Oa', '/Oi'],
    'codegen': ['', '/Gs'],
    'debug': ['', '/Zi'],
}

RE_STRIP_ADDR = re.compile(r'^\s*[0-9A-Fa-f]{1,6}:[0-9A-Fa-f]{1,8}\s+')
RE_LISTING_PREFIX = re.compile(r'^\*\*\*\s+[0-9A-Fa-f]+\s+[0-9A-Fa-f][0-9A-Fa-f ]+\s+(.*)$')
RE_LISTING_PREFIX_LOOSE = re.compile(r'^\s*\*{3}\s+[0-9A-Fa-f]+\s+[0-9A-Fa-f][0-9A-Fa-f ]*\s+(.*)$')
RE_DOLLAR_LABEL = re.compile(r'\$[A-Za-z0-9_.$?@]+')
RE_DOLLAR_LABEL_CAPTURE = re.compile(r'\$[A-Za-z_.$?@][A-Za-z0-9_.$?@]*')
RE_PURE_LABEL = re.compile(r'^\s*([A-Za-z_.$?@][A-Za-z0-9_.$?@]*):\s*$')
RE_SKIP_LINE_COMMENT = re.compile(r'^;\s*Line\b', re.I)
RE_SKIP_DECL = re.compile(r'^\s*(PUBLIC|EXTRN|ENDP)\b', re.I)
RE_SKIP_REG = re.compile(r'^\s*;\s*register\b', re.I)

def find_exe(tc_root: Path, exe_name: str) -> str | None:
    for c in (tc_root / 'BIN' / exe_name, tc_root / 'bin' / exe_name, tc_root / exe_name):
        if c.exists():
            return 'D:\\' + str(c.relative_to(tc_root)).replace('/', '\\')
    return None


def canonical_flag_string(flags):
    flags=[f for f in flags if f]
    return ' '.join(sorted(set(flags), key=lambda x:x.lower()))


def generate_msc_combos():
    out=[]
    for base in MSC_GROUPS['opt_base']:
        for n in range(0, len(MSC_GROUPS['opt_toggles'])+1):
            for opt in itertools.combinations(MSC_GROUPS['opt_toggles'], n):
                for dbg in MSC_GROUPS['debug']:
                    for cg in MSC_GROUPS['codegen']:
                        out.append(canonical_flag_string([base,*opt,dbg,cg]))
    return sorted(set(out))


def normalize_asm_text(text:str)->str:
    out=[]
    for ln in text.splitlines():
        s=ln.strip()
        if not s or s.startswith(';|***'):
            continue
        m=RE_LISTING_PREFIX.match(s)
        if m: s=m.group(1).strip()
        s=RE_STRIP_ADDR.sub('',s)
        s=RE_DOLLAR_LABEL.sub('LBL',s)
        out.append(s)
    return '\n'.join(out)


def sanitize_asm_strict(asm_text: str) -> str:
    out=[]
    label_map={}
    seq=1
    for ln in asm_text.splitlines():
        s=ln.rstrip('\r\n')
        st=s.strip()
        if not st or st.startswith(';|***'):
            continue
        if RE_SKIP_LINE_COMMENT.match(st):
            continue
        m=RE_LISTING_PREFIX_LOOSE.match(s)
        if m: s=m.group(1).strip()
        s=RE_STRIP_ADDR.sub('',s)
        for tok in RE_DOLLAR_LABEL_CAPTURE.findall(s):
            if tok not in label_map:
                label_map[tok]=f'lbl{seq}'; seq+=1
            s=s.replace(tok,label_map[tok])
        ml=RE_PURE_LABEL.match(s)
        if ml:
            raw=ml.group(1)
            if raw not in label_map:
                label_map[raw]=f'lbl{seq}'; seq+=1
            s=f"{label_map[raw]}:"
        if RE_SKIP_DECL.match(s):
            continue
        if RE_SKIP_REG.match(s):
            continue
        if s.strip(): out.append(s)
    return '\n'.join(out)


def extract_functions_c(text:str):
    out=[]
    n=len(text); i=0; depth=0
    in_str=in_chr=in_line=in_block=False; esc=False
    top_open=None; top_header_start=0
    while i<n:
        c=text[i]; nxt=text[i+1] if i+1<n else ''
        if in_line:
            if c in '\r\n': in_line=False
            i+=1; continue
        if in_block:
            if c=='*' and nxt=='/': in_block=False; i+=2
            else: i+=1
            continue
        if in_str:
            if esc: esc=False
            elif c=='\\': esc=True
            elif c=='"': in_str=False
            i+=1; continue
        if in_chr:
            if esc: esc=False
            elif c=='\\': esc=True
            elif c=="'": in_chr=False
            i+=1; continue
        if c=='/' and nxt=='/': in_line=True; i+=2; continue
        if c=='/' and nxt=='*': in_block=True; i+=2; continue
        if c=='"': in_str=True; i+=1; continue
        if c=="'": in_chr=True; i+=1; continue
        if c=='{':
            if depth==0:
                top_open=i
                j=i-1
                while j>0 and text[j] in ' \t\r\n': j-=1
                while j>0 and text[j] not in '};\r\n': j-=1
                top_header_start=j+1
            depth+=1
        elif c=='}':
            if depth>0:
                depth-=1
                if depth==0 and top_open is not None:
                    s=top_header_start; e=i+1
                    header=text[s:top_open]
                    m=re.search(r'([A-Za-z_][A-Za-z0-9_]*)\s*\([^{};]*\)\s*$',header,re.S)
                    bad=re.search(r'\b(if|for|while|switch|else)\s*\([^)]*\)\s*$',header,re.S)
                    if m and not bad:
                        out.append({'name':m.group(1),'text':text[s:e]})
                    top_open=None
        i+=1
    return out


def strip_comments_preserve_layout(text:str)->str:
    b=text.encode('latin1',errors='replace')
    out=bytearray(); i=0; n=len(b)
    in_str=in_chr=in_line=in_block=False; esc=False
    while i<n:
        c=b[i]; nxt=b[i+1] if i+1<n else None
        if in_line:
            if c in (10,13): out.append(c); in_line=False
            else: out.append(32)
            i+=1; continue
        if in_block:
            if c==42 and nxt==47: out.extend(b'  '); i+=2; in_block=False
            else: out.append(c if c in (10,13) else 32); i+=1
            continue
        if in_str:
            out.append(c)
            if esc: esc=False
            elif c==92: esc=True
            elif c==34: in_str=False
            i+=1; continue
        if in_chr:
            out.append(c)
            if esc: esc=False
            elif c==92: esc=True
            elif c==39: in_chr=False
            i+=1; continue
        if c==34: in_str=True; out.append(c); i+=1; continue
        if c==39: in_chr=True; out.append(c); i+=1; continue
        if c==47 and nxt==47: out.extend(b'  '); i+=2; in_line=True; continue
        if c==47 and nxt==42: out.extend(b'  '); i+=2; in_block=True; continue
        out.append(c); i+=1
    return out.decode('latin1',errors='replace')


def collapse_blank_lines(text:str,max_blank=1)->str:
    out=[]; blank=0
    for ln in text.splitlines():
        if ln.strip()=='':
            blank+=1
            if blank<=max_blank: out.append('')
        else:
            blank=0; out.append(ln.rstrip())
    return '\n'.join(out).strip()+'\n'


def build_symbol_map_scoped(text:str, fn_name:str):
    ids=sorted(set(re.findall(r'\b[A-Za-z_][A-Za-z0-9_]*\b',text)))
    ids=[x for x in ids if x.lower() not in C_KEYWORDS]
    smap={}; used=set()
    if fn_name: smap[fn_name]='fn1'; used.add(fn_name)
    m=re.search(r'\((.*?)\)',text,re.S)
    arg_i=1
    if m:
        for p in re.findall(r'\b([A-Za-z_][A-Za-z0-9_]*)\b',m.group(1)):
            if p.lower() in C_KEYWORDS or p in used: continue
            smap[p]=f'arg{arg_i}'; arg_i+=1; used.add(p)
    loc_i=1
    for ln in text.splitlines():
        if ';' not in ln: continue
        if re.match(r'^\s*(if|for|while|switch|return)\b',ln): continue
        names=re.findall(r'\b([A-Za-z_][A-Za-z0-9_]*)\b',ln)
        if not names: continue
        if names[0].lower() not in C_KEYWORDS and names[0] not in {'struct','union','enum'}: continue
        for nm in names[1:]:
            if nm.lower() in C_KEYWORDS or nm in used: continue
            smap[nm]=f'loc{loc_i}'; loc_i+=1; used.add(nm)
    id_i=1
    for nm in ids:
        if nm in used: continue
        if re.match(r'^[A-Z_][A-Z0-9_]*$',nm): continue
        smap[nm]=f'id{id_i}'; id_i+=1; used.add(nm)
    return smap


def apply_symbol_map(text:str,smap:dict):
    if not smap:
        return text
    items=sorted(smap.items(), key=lambda kv:(-len(kv[0]),kv[0]))
    escaped='|'.join(re.escape(old) for old,_ in items)
    mapping=dict(items)
    pat_main=re.compile(rf'\b({escaped})\b')
    pat_us=re.compile(rf'\b_({escaped})\b')
    text=pat_main.sub(lambda m: mapping[m.group(1)], text)
    text=pat_us.sub(lambda m: mapping[m.group(1)], text)
    return text


def extract_asm_for_function(cod:str, fn_name:str):
    lines=cod.splitlines()
    fn=re.sub(r'[^a-z0-9_]','',fn_name.lower())
    lbls={fn,'_'+fn}
    start=None
    for i,ln in enumerate(lines):
        s=ln.strip()
        if s.endswith(':'):
            raw=s[:-1].strip(); raw_n=re.sub(r'[^a-z0-9_]','',raw.lower())
            if raw_n in lbls: start=i; break
        mproc=re.match(r'^([A-Za-z_.$?@][A-Za-z0-9_.$?@]*)\s+PROC\b',s,re.I)
        if mproc:
            raw_n=re.sub(r'[^a-z0-9_]','',mproc.group(1).lstrip('_').lower())
            if raw_n in lbls: start=i; break
    if start is None:
        for i,ln in enumerate(lines):
            if fn and fn in re.sub(r'[^a-z0-9_]','',ln.lower()):
                lo=max(0,i-60); hi=min(len(lines),i+260)
                return '\n'.join(lines[lo:hi]),'mention_window'
        return cod,'full_fallback'
    end=len(lines)
    for j in range(start+1,len(lines)):
        s=lines[j].strip()
        if re.match(r'^[A-Za-z_.$?@][A-Za-z0-9_.$?@]*\s+ENDP\b',s,re.I): end=j; break
        if re.match(r'^[A-Za-z_.$?@][A-Za-z0-9_.$?@]*:\s*$',s): end=j; break
    return '\n'.join(lines[start:end]),'label_match'


def compile_variant(src:Path, tc_name:str, flags:str, timeout:int, slot:int=0, retries:int=2):
    tc=TOOLCHAINS[tc_name]
    exe_dos=find_exe(tc['root'], tc['exe'])
    if not exe_dos: return None
    base = re.sub(r'[^A-Za-z0-9_]', '', src.stem.upper())[:4] or 'SRC'
    suf = f"{slot % 65536:04X}"
    asm_name = f"{base}{suf}.ASM"
    obj_name = f"{base}{suf}.OBJ"
    asm_path = src.parent / asm_name
    obj_path = src.parent / obj_name
    cmd=[
        str(KVIKDOS), f'--mount=c:{src.parent}/', f'--mount=d:{tc["root"]}/', '--drive=c', '--cwd-dos=C:\\',
        '--env=PATH=D:\\BIN;D:\\','--env=INCLUDE=D:\\INCLUDE','--env=LIB=D:\\LIB',
        exe_dos,'/c','/AS',*([x for x in flags.split() if x]),f'/FaC:\\{asm_name}',f'/FoC:\\{obj_name}',f'C:\\{src.name}'
    ]
    r=None
    for _ in range(max(1, retries)):
        try:
            r=subprocess.run(cmd,cwd=str(REPO_ROOT),stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,encoding='latin1',errors='replace',timeout=timeout)
        except subprocess.TimeoutExpired:
            continue
        if asm_path.exists():
            break
    if not asm_path.exists() or r is None:
        return None
    data=asm_path.read_bytes()
    try:
        asm_path.unlink()
    except OSError:
        pass
    try:
        obj_path.unlink()
    except OSError:
        pass
    raw=hashlib.md5(data).hexdigest()
    norm=hashlib.md5(normalize_asm_text(data.decode('latin1',errors='replace')).encode('utf-8')).hexdigest()
    return {'flags':flags,'raw':raw,'norm':norm,'asm':data.decode('latin1',errors='replace'),'rc':r.returncode}


def make_stage1_skeleton(ans_text: str) -> str:
    sk = ans_text
    sk = re.sub(r'\b(unsigned|signed|short|long|int|char|float|double|void)\b', 'T', sk)
    sk = re.sub(r'\b(struct|union|enum)\s+[A-Za-z_][A-Za-z0-9_]*', r'\1 T', sk)
    sk = re.sub(r'\s+', ' ', sk).strip()
    return sk + '\n'


def make_prompt_tags(compiler: str, flags: str, source_rel: str) -> str:
    lang = 'dos-cpp' if source_rel.lower().endswith('.cpp') else 'dos-c'
    opt = 'OPTUNK'
    m = re.search(r'/O([a-zA-Z]+)', flags)
    if m:
        opt = ('O' + m.group(1)).upper()
    return f"[{compiler.upper()}][{opt}][16BIT-DOS][{lang}]"


def build_user_prompt(asm: str, tags: str, stage: int, skeleton: str = '') -> str:
    pref = (tags + '\n') if tags else ''
    if stage == 1:
        return pref + "Recover the C/C++ function skeleton (types/identifiers may stay anonymized) from this assembly:\n\n" + asm
    if stage == 2:
        return pref + "Recover readable C/C++ from this assembly, using the provided skeleton as structure guidance.\n\n[SKELETON]\n" + skeleton + "\n[ASSEMBLY]\n" + asm
    return pref + "Recover the function from this assembly:\n\n" + asm


def process_source(src: Path, args, combos):
    rel=src.relative_to(REPO_ROOT).as_posix()
    text=src.read_text('latin1',errors='replace')
    funcs=extract_functions_c(text)
    seen_raw=set(); seen_norm=set(); kept=[]
    for i, fs in enumerate(combos):
        v=compile_variant(src,args.compiler,fs,args.timeout,i,args.compile_retries)
        if not v:
            continue
        if v['raw'] in seen_raw or v['norm'] in seen_norm:
            continue
        seen_raw.add(v['raw']); seen_norm.add(v['norm']); kept.append(v)
        if args.max_kept_variants_per_source>0 and len(kept)>=args.max_kept_variants_per_source:
            break
    rows=[]
    for v in kept:
        for fn in funcs:
            ans=collapse_blank_lines(strip_comments_preserve_layout(fn['text']),1)
            smap=build_symbol_map_scoped(ans, fn['name'])
            ans=apply_symbol_map(ans,smap)
            asm,mode=extract_asm_for_function(v['asm'], fn['name'])
            asm=apply_symbol_map(asm,smap)
            asm=sanitize_asm_strict(asm)
            lines=[x for x in asm.splitlines() if x.strip()]
            if mode!='label_match' or len(lines)<8 or len(lines)>4000:
                continue
            tags = make_prompt_tags(args.compiler, v['flags'], rel) if args.prompt_tags else ''
            if args.dataset_mode == 'two-stage':
                sk = make_stage1_skeleton(ans)
                row1={'messages':[
                        {'role':'system','content':'Recover C/C++ function structure from DOS assembly.'},
                        {'role':'user','content':build_user_prompt(asm, tags, 1)},
                        {'role':'assistant','content':sk},
                    ]}
                row2={'messages':[
                        {'role':'system','content':'Recover readable C/C++ from DOS assembly using a provided skeleton.'},
                        {'role':'user','content':build_user_prompt(asm, tags, 2, sk)},
                        {'role':'assistant','content':ans},
                    ]}
                if not args.no_metadata:
                    base_meta={
                        'function': fn['name'],
                        'flags': v['flags'],
                        'compiler': args.compiler,
                        'raw_hash': v['raw'],
                        'norm_hash': v['norm'],
                        'source': rel,
                        'quality': 'high',
                    }
                    row1['meta']=dict(base_meta, stage='skeleton')
                    row2['meta']=dict(base_meta, stage='readable')
                rows.append(row1)
                rows.append(row2)
            else:
                row={'messages':[
                        {'role':'system','content':'Recover the C/C++ function from DOS compiler assembly/listing.'},
                        {'role':'user','content':build_user_prompt(asm, tags, 0)},
                        {'role':'assistant','content':ans},
                    ]}
                if not args.no_metadata:
                    row['meta']={
                        'function': fn['name'],
                        'flags': v['flags'],
                        'compiler': args.compiler,
                        'raw_hash': v['raw'],
                        'norm_hash': v['norm'],
                        'source': rel,
                        'quality': 'high',
                    }
                rows.append(row)
    return {
        'source': rel,
        'rows': rows,
        'kept_variants': len(kept),
        'dataset_rows': len(rows),
        'combos_total': len(combos),
    }


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--reports', nargs='+', default=['artifacts/msex_cod_build_report.json'])
    ap.add_argument('--compiler', default='msc61', choices=list(TOOLCHAINS.keys()))
    ap.add_argument('--out', default='artifacts/dataset/cod_combo_strict_all.jsonl')
    ap.add_argument('--index', default='artifacts/dataset/cod_combo_index.jsonl')
    ap.add_argument('--timeout', type=int, default=20)
    ap.add_argument('--resume', action='store_true')
    ap.add_argument('--max-sources', type=int, default=0)
    ap.add_argument('--max-combos', type=int, default=0)
    ap.add_argument('--max-kept-variants-per-source', type=int, default=24)
    ap.add_argument('--no-metadata', action='store_true')
    ap.add_argument('--jobs', type=int, default=1)
    ap.add_argument('--compile-retries', type=int, default=2)
    ap.add_argument('--dataset-mode', choices=['single','two-stage'], default='single')
    ap.add_argument('--prompt-tags', action='store_true')
    args=ap.parse_args()

    srcs=[]
    for rp in args.reports:
        p=Path(rp)
        if not p.exists():
            continue
        rep=json.loads(p.read_text(encoding='utf-8'))
        srcs.extend([REPO_ROOT/r['file'] for r in rep.get('results',[]) if r.get('success')])
    srcs=sorted(set(srcs))
    srcs=[p for p in srcs if p.suffix.upper() in {'.C','.CPP'} and p.exists()]
    if args.max_sources>0: srcs=srcs[:args.max_sources]

    Path(args.out).parent.mkdir(parents=True, exist_ok=True)
    done=set()
    if args.resume and Path(args.index).exists():
        for ln in Path(args.index).open(encoding='utf-8'):
            try: done.add(json.loads(ln).get('source'))
            except Exception: pass

    combos=generate_msc_combos()
    if args.max_combos>0:
        combos=combos[:args.max_combos]
    total_rows=0
    with Path(args.out).open('a' if args.resume else 'w',encoding='utf-8') as out_f, Path(args.index).open('a' if args.resume else 'w',encoding='utf-8') as idx_f:
        for si,src in enumerate(srcs, start=1):
            rel=src.relative_to(REPO_ROOT).as_posix()
            if rel in done:
                continue
            if args.jobs <= 1:
                res=process_source(src, args, combos)
            else:
                # Handled in parallel section below.
                continue
            for row in res['rows']:
                out_f.write(json.dumps(row,ensure_ascii=False)+'\n')
                total_rows+=1
            idx_f.write(json.dumps({'source':res['source'],'compiler':args.compiler,'combos_total':res['combos_total'],'kept_variants':res['kept_variants'],'dataset_rows':res['dataset_rows']})+'\n')
            print(f"[{si}/{len(srcs)}] {res['source']}: variants={res['kept_variants']} rows={res['dataset_rows']}")

        if args.jobs > 1:
            todo=[s for s in srcs if s.relative_to(REPO_ROOT).as_posix() not in done]
            results={}
            with concurrent.futures.ThreadPoolExecutor(max_workers=max(1,args.jobs)) as ex:
                futs={ex.submit(process_source, s, args, combos): s for s in todo}
                for fut in concurrent.futures.as_completed(futs):
                    s=futs[fut]
                    rel=s.relative_to(REPO_ROOT).as_posix()
                    try:
                        results[rel]=fut.result()
                    except Exception:
                        results[rel]={'source':rel,'rows':[],'combos_total':len(combos),'kept_variants':0,'dataset_rows':0}
            rank={p.relative_to(REPO_ROOT).as_posix():i for i,p in enumerate(srcs, start=1)}
            for rel in sorted(results, key=lambda r: rank.get(r,10**9)):
                res=results[rel]
                for row in res['rows']:
                    out_f.write(json.dumps(row,ensure_ascii=False)+'\n')
                    total_rows+=1
                idx_f.write(json.dumps({'source':res['source'],'compiler':args.compiler,'combos_total':res['combos_total'],'kept_variants':res['kept_variants'],'dataset_rows':res['dataset_rows']})+'\n')
                print(f"[{rank.get(rel,0)}/{len(srcs)}] {res['source']}: variants={res['kept_variants']} rows={res['dataset_rows']}")

    print(f'Done. dataset_rows={total_rows} out={args.out}')

if __name__=='__main__':
    main()
