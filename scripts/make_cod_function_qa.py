#!/usr/bin/env python3
import argparse
import json
import re
from pathlib import Path

REPO_ROOT = Path('/home/xor/nndecomp')
C_KEYWORDS = {
    'auto','break','case','char','const','continue','default','do','double','else','enum','extern',
    'float','for','goto','if','int','long','register','return','short','signed','sizeof','static',
    'struct','switch','typedef','union','unsigned','void','volatile','while','near','far','huge','interrupt'
}


def read_cod_text(path: Path) -> str | None:
    if not path.exists() or not path.is_file():
        return None
    try:
        return path.read_text(encoding='latin1', errors='replace')
    except Exception:
        return None


def normalize_name(n: str) -> str:
    return re.sub(r'[^a-z0-9_]', '', n.lower())


def find_nearby_map_files(src: Path, max_up: int = 4):
    out = []
    cur = src.parent
    for _ in range(max_up + 1):
        for p in cur.glob('*.MAP'):
            if p.is_file():
                out.append(p)
        if cur == cur.parent:
            break
        cur = cur.parent
    # deterministic
    return sorted(set(out))


def parse_map_symbols(map_path: Path):
    syms = set()
    txt = map_path.read_text(encoding='latin1', errors='replace')
    for ln in txt.splitlines():
        # Typical MAP rows have segment:offset then symbol name
        m = re.search(r'\b[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,8}\b\s+([A-Za-z_.$?@][A-Za-z0-9_.$?@]*)', ln)
        if m:
            s = m.group(1).strip()
            s = s.lstrip('_')
            if s and s.lower() not in C_KEYWORDS:
                syms.add(s)
    return syms


def build_symbol_map(text: str, fn_name: str, map_symbols: set[str]):
    ids = set(re.findall(r'\b[A-Za-z_][A-Za-z0-9_]*\b', text))
    ids = {x for x in ids if x.lower() not in C_KEYWORDS}
    # Keep only MAP-backed ids if available; else fallback to ids from function text.
    cand = sorted({x for x in ids if x in map_symbols} or ids)

    out = {}
    fn_idx = 1
    var_idx = 1
    for name in cand:
        if name == fn_name:
            out[name] = f'fn_{fn_idx:04d}'
            fn_idx += 1
        elif re.match(r'^[A-Z_][A-Z0-9_]*$', name):
            # likely macro/const-like: skip renaming
            continue
        else:
            out[name] = f'id_{var_idx:04d}'
            var_idx += 1
    if fn_name and fn_name not in out:
        out[fn_name] = f'fn_{fn_idx:04d}'
    return out


def apply_symbol_map(text: str, smap: dict[str, str]) -> str:
    if not smap:
        return text
    # longest-first to avoid partial overlaps; replace plain and underscore-prefixed forms.
    items = sorted(smap.items(), key=lambda kv: (-len(kv[0]), kv[0]))
    for old, new in items:
        text = re.sub(rf'\b{re.escape(old)}\b', new, text)
        text = re.sub(rf'\b_{re.escape(old)}\b', new, text)
    return text


def sanitize_asm_strict(asm_text: str, normalize_labels: bool = True) -> str:
    out = []
    label_map = {}
    label_seq = 1

    for ln in asm_text.splitlines():
        s = ln.rstrip('\r\n')
        st = s.strip()
        if not st:
            continue
        # Drop C-source echo/comment leakage and file/line markers.
        if st.startswith(';|***'):
            continue
        if re.match(r'^;+\s*Line\s+\d+\s*$', st, flags=re.I):
            continue
        if re.match(r'^;+\s*Line\b', st, flags=re.I):
            continue
        # Drop raw byte/address listing lines, keep decoded mnemonic tail.
        mlist = re.match(r'^\s*\*{3}\s+[0-9A-Fa-f]+\s+[0-9A-Fa-f][0-9A-Fa-f ]*\s+(.*)$', s)
        if mlist:
            s = mlist.group(1).strip()
        # Remove leading absolute address prefixes like "0000:1234 ..."
        s = re.sub(r'^\s*[0-9A-Fa-f]{1,6}:[0-9A-Fa-f]{1,8}\s+', '', s)

        if normalize_labels:
            # Normalize synthetic compiler local labels like $JCC16 / $I123.
            for tok in re.findall(r'\$[A-Za-z_.$?@][A-Za-z0-9_.$?@]*', s):
                if tok not in label_map:
                    label_map[tok] = f'lbl{label_seq}'
                    label_seq += 1
                s = s.replace(tok, label_map[tok])
            # Normalize labels "foo:" and jumps/calls to known labels.
            ml = re.match(r'^\s*([A-Za-z_.$?@][A-Za-z0-9_.$?@]*):\s*$', s)
            if ml:
                raw = ml.group(1)
                if raw not in label_map:
                    label_map[raw] = f'lbl{label_seq}'
                    label_seq += 1
                s = f'{label_map[raw]}:'
            else:
                # Normalize branch targets by token.
                toks = re.split(r'(\W+)', s)
                for i, t in enumerate(toks):
                    if re.match(r'^[A-Za-z_.$?@][A-Za-z0-9_.$?@]*$', t):
                        if t in label_map:
                            toks[i] = label_map[t]
                s = ''.join(toks)

        # Drop bare listing directives that usually don't help semantic recovery.
        # Keep structural directives such as SEGMENT/ENDS/ASSUME/GROUP.
        if re.match(r'^\s*(PUBLIC|EXTRN|ENDP)\b', s, flags=re.I):
            continue
        # Drop listing-only register allocation comments.
        if re.match(r'^\s*;\s*register\b', s, flags=re.I):
            continue
        if re.match(r'^\s*;\s*[A-Za-z_][A-Za-z0-9_]*\s*=\s*\d+\s*$', s):
            continue

        if s.strip():
            out.append(s)
    return '\n'.join(out)


def strip_comments_preserve_layout(text: str) -> str:
    b = text.encode('latin1', errors='replace')
    out = bytearray()
    i, n = 0, len(b)
    in_str = in_chr = in_line = in_block = False
    esc = False
    while i < n:
        c = b[i]
        nxt = b[i + 1] if i + 1 < n else None
        if in_line:
            if c in (10, 13):
                out.append(c)
                in_line = False
            else:
                out.append(32)
            i += 1
            continue
        if in_block:
            if c == 42 and nxt == 47:
                out.extend(b'  ')
                i += 2
                in_block = False
            else:
                out.append(c if c in (10, 13) else 32)
                i += 1
            continue
        if in_str:
            out.append(c)
            if esc:
                esc = False
            elif c == 92:
                esc = True
            elif c == 34:
                in_str = False
            i += 1
            continue
        if in_chr:
            out.append(c)
            if esc:
                esc = False
            elif c == 92:
                esc = True
            elif c == 39:
                in_chr = False
            i += 1
            continue
        if c == 34:
            in_str = True
            out.append(c)
            i += 1
            continue
        if c == 39:
            in_chr = True
            out.append(c)
            i += 1
            continue
        if c == 47 and nxt == 47:
            out.extend(b'  ')
            i += 2
            in_line = True
            continue
        if c == 47 and nxt == 42:
            out.extend(b'  ')
            i += 2
            in_block = True
            continue
        out.append(c)
        i += 1
    return out.decode('latin1', errors='replace')


def collapse_blank_lines(text: str, max_blank: int = 1) -> str:
    out = []
    blank = 0
    for ln in text.splitlines():
        if ln.strip() == '':
            blank += 1
            if blank <= max_blank:
                out.append('')
        else:
            blank = 0
            out.append(ln.rstrip())
    return '\n'.join(out).strip() + '\n'


def function_has_single_body(text: str) -> bool:
    depth = 0
    bodies = 0
    in_str = in_chr = in_line = in_block = False
    esc = False
    for i, ch in enumerate(text):
        nxt = text[i + 1] if i + 1 < len(text) else ''
        if in_line:
            if ch in '\r\n':
                in_line = False
            continue
        if in_block:
            if ch == '*' and nxt == '/':
                in_block = False
            continue
        if in_str:
            if esc:
                esc = False
            elif ch == '\\':
                esc = True
            elif ch == '"':
                in_str = False
            continue
        if in_chr:
            if esc:
                esc = False
            elif ch == '\\':
                esc = True
            elif ch == "'":
                in_chr = False
            continue
        if ch == '/' and nxt == '/':
            in_line = True
            continue
        if ch == '/' and nxt == '*':
            in_block = True
            continue
        if ch == '"':
            in_str = True
            continue
        if ch == "'":
            in_chr = True
            continue
        if ch == '{':
            if depth == 0:
                bodies += 1
            depth += 1
        elif ch == '}':
            depth = max(depth - 1, 0)
    return bodies == 1


def build_symbol_map_scoped(text: str, fn_name: str):
    ids = sorted(set(re.findall(r'\b[A-Za-z_][A-Za-z0-9_]*\b', text)))
    ids = [x for x in ids if x.lower() not in C_KEYWORDS]
    smap = {}
    used = set()
    if fn_name:
        smap[fn_name] = 'fn1'
        used.add(fn_name)
    # parameter names
    m = re.search(r'\((.*?)\)', text, flags=re.S)
    arg_i = 1
    if m:
        params = re.findall(r'\b([A-Za-z_][A-Za-z0-9_]*)\b', m.group(1))
        for p in params:
            if p.lower() in C_KEYWORDS or p in used:
                continue
            smap[p] = f'arg{arg_i}'
            arg_i += 1
            used.add(p)
    # local decl lines
    loc_i = 1
    for ln in text.splitlines():
        if ';' not in ln:
            continue
        if re.match(r'^\s*(if|for|while|switch|return)\b', ln):
            continue
        names = re.findall(r'\b([A-Za-z_][A-Za-z0-9_]*)\b', ln)
        if not names:
            continue
        if names[0].lower() not in C_KEYWORDS and names[0] not in {'struct', 'union', 'enum'}:
            continue
        for nm in names[1:]:
            if nm.lower() in C_KEYWORDS or nm in used:
                continue
            smap[nm] = f'loc{loc_i}'
            loc_i += 1
            used.add(nm)
    # remaining identifiers
    id_i = 1
    for nm in ids:
        if nm in used:
            continue
        if re.match(r'^[A-Z_][A-Z0-9_]*$', nm):
            continue
        smap[nm] = f'id{id_i}'
        id_i += 1
        used.add(nm)
    return smap


def extract_asm_for_function(cod: str, fn_name: str, max_chars: int) -> tuple[str, str]:
    lines = cod.splitlines()
    if not fn_name or fn_name == '__file__':
        return cod[:max_chars], 'full_fallback'

    fn = normalize_name(fn_name)
    lbls = [fn, '_' + fn]

    start = None
    for i, ln in enumerate(lines):
        s = ln.strip()
        # MASM/TASM labels.
        if s.endswith(':'):
            raw = s[:-1].strip()
            raw_n = normalize_name(raw)
            if raw_n in lbls:
                start = i
                break
        # Microsoft listing style: _name PROC NEAR/FAR
        mproc = re.match(r'^([A-Za-z_.$?@][A-Za-z0-9_.$?@]*)\s+PROC\b', s, flags=re.I)
        if mproc:
            raw_n = normalize_name(mproc.group(1).lstrip('_'))
            if raw_n in lbls:
                start = i
                break
        # PUBLIC symbol lines can anchor nearby PROC blocks.
        mpub = re.match(r'^PUBLIC\s+([A-Za-z_.$?@][A-Za-z0-9_.$?@]*)\b', s, flags=re.I)
        if mpub:
            raw_n = normalize_name(mpub.group(1).lstrip('_'))
            if raw_n in lbls:
                # search forward for PROC/label
                for j in range(i, min(i + 80, len(lines))):
                    sj = lines[j].strip()
                    if re.match(r'^([A-Za-z_.$?@][A-Za-z0-9_.$?@]*)\s+PROC\b', sj, flags=re.I):
                        start = j
                        break
                    if sj.endswith(':'):
                        start = j
                        break
                if start is not None:
                    break

    if start is None:
        # fallback: near-mention window
        for i, ln in enumerate(lines):
            if fn in normalize_name(ln):
                lo = max(0, i - 60)
                hi = min(len(lines), i + 260)
                txt = '\n'.join(lines[lo:hi])
                return txt[:max_chars], 'mention_window'
        return cod[:max_chars], 'full_fallback'

    end = len(lines)
    for j in range(start + 1, len(lines)):
        s = lines[j].strip()
        if re.match(r'^[A-Za-z_.$?@][A-Za-z0-9_.$?@]*:\s*$', s):
            end = j
            break
        if re.match(r'^[A-Za-z_.$?@][A-Za-z0-9_.$?@]*\s+ENDP\b', s, flags=re.I):
            end = j
            break
    txt = '\n'.join(lines[start:end])
    return txt[:max_chars], 'label_match'


def choose_answer_variant(row: dict, variant: str) -> str:
    fn = row.get('function', {})
    raw_fn = fn.get('text_latin1')
    if not raw_fn:
        return ''
    if variant == 'function_raw':
        return raw_fn
    if variant == 'nocomments':
        return strip_comments_preserve_layout(raw_fn)
    if variant == 'pretty':
        # conservative: pretty == compact(nocomments) in strict mode
        return collapse_blank_lines(strip_comments_preserve_layout(raw_fn), max_blank=1)
    if variant == 'compact':
        return collapse_blank_lines(strip_comments_preserve_layout(raw_fn), max_blank=1)
    return raw_fn


def main():
    ap = argparse.ArgumentParser(description='Build COD->C-function QA training data.')
    ap.add_argument('--preprocessed-jsonl', default='artifacts/dos_c_preprocessed_compare_full.jsonl')
    ap.add_argument('--out', default='artifacts/cod_function_qa.jsonl')
    ap.add_argument('--answer-variant', choices=['function_raw', 'nocomments', 'pretty', 'compact'], default='compact')
    ap.add_argument('--max-asm-chars', type=int, default=20000)
    ap.add_argument('--require-cod', action='store_true')
    ap.add_argument('--anonymize-symbols', action='store_true')
    ap.add_argument('--anonymize-asm', action='store_true')
    ap.add_argument('--strict-no-leak', action='store_true', default=True)
    ap.add_argument('--keep-meta-path', action='store_true')
    ap.add_argument('--only-label-match', action='store_true')
    ap.add_argument('--min-asm-lines', type=int, default=40)
    ap.add_argument('--max-asm-lines', type=int, default=4000)
    args = ap.parse_args()

    inp = Path(args.preprocessed_jsonl)
    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)

    n = 0
    kept = 0
    with inp.open('r', encoding='utf-8') as f, out.open('w', encoding='utf-8') as w:
        for line in f:
            n += 1
            row = json.loads(line)
            rel = row.get('path')
            fn = row.get('function', {})
            fn_name = fn.get('name', '__file__')
            if not rel:
                continue
            src = REPO_ROOT / rel
            cod = src.with_suffix('.COD')
            cod_text = read_cod_text(cod)
            if cod_text is None:
                if args.require_cod:
                    continue
                cod_text = ''
            asm_text, asm_mode = extract_asm_for_function(cod_text, fn_name, args.max_asm_chars)
            answer = choose_answer_variant(row, args.answer_variant)
            if not answer.strip():
                continue
            if args.only_label_match and asm_mode != 'label_match':
                continue
            symbol_map = {}
            map_files = []
            if args.anonymize_symbols:
                map_files = find_nearby_map_files(src)
                map_syms = set()
                for mp in map_files:
                    try:
                        map_syms |= parse_map_symbols(mp)
                    except Exception:
                        pass
                symbol_map = build_symbol_map_scoped(answer, fn_name)
                answer = apply_symbol_map(answer, symbol_map)
                if args.anonymize_asm:
                    asm_text = apply_symbol_map(asm_text, symbol_map)
            if args.strict_no_leak:
                asm_text = sanitize_asm_strict(asm_text, normalize_labels=True)
                if not asm_text.strip():
                    continue
            asm_lines = len([x for x in asm_text.splitlines() if x.strip()])
            if asm_lines < args.min_asm_lines or asm_lines > args.max_asm_lines:
                continue
            if not function_has_single_body(answer):
                continue

            qa = {
                'id': row.get('id', f'{rel}#unknown'),
                'messages': [
                    {'role': 'system', 'content': 'Recover the C/C++ function from DOS compiler assembly/listing.'},
                    {'role': 'user', 'content': f'Recover the function from this assembly:\n\n{asm_text}'},
                    {'role': 'assistant', 'content': answer},
                ],
                'meta': {
                    'function': fn_name,
                    'asm_extract_mode': asm_mode,
                    'answer_variant': args.answer_variant,
                    'anonymized': bool(args.anonymize_symbols),
                    'strict_no_leak': bool(args.strict_no_leak),
                    'asm_line_count': asm_lines,
                    'quality': 'high' if (asm_mode == 'label_match' and asm_lines <= 2500) else 'medium',
                },
            }
            if args.keep_meta_path:
                qa['meta']['path'] = rel
                qa['meta']['cod'] = cod.relative_to(REPO_ROOT).as_posix()
                qa['meta']['map_files'] = [p.relative_to(REPO_ROOT).as_posix() for p in map_files]
                qa['meta']['symbol_map'] = symbol_map
            w.write(json.dumps(qa, ensure_ascii=False) + '\n')
            kept += 1

    print(f'rows_in={n} rows_out={kept} out={out}')


if __name__ == '__main__':
    main()
