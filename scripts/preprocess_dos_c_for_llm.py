#!/usr/bin/env python3
import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
KVIKDOS = Path('/home/xor/kvikdos/kvikdos')
C_EXTS = {'.c', '.cpp'}
RISKY_TOKENS = (
    b'interrupt', b'__interrupt', b'far', b'near', b'huge', b'_asm', b'asm', b'#pragma', b'__emit__'
)
LLM4D_TYPEDEF_MAP = {
    "__int64": "long long",
    "__int32": "int",
    "__int16": "short",
    "__int8": "char",
    "_QWORD": "unsigned long",
    "_DWORD": "unsigned int",
    "_WORD": "unsigned short",
    "_BYTE": "unsigned char",
    "_BOOL8": "unsigned char",
    "_BOOL4": "int",
    "_TBYTE": "unsigned short",
    "_OWORD": "long double",
    "_UNKNOWN": "void",
    "size_t": "unsigned int",
}
TOOLCHAINS = {
    'msc61': {'root': REPO_ROOT / 'msc61', 'kind': 'msc', 'exe': 'CL.EXE'},
    'msc6': {'root': REPO_ROOT / 'msc60', 'kind': 'msc', 'exe': 'CL.EXE'},
    'msc5': {'root': REPO_ROOT / 'msc5', 'kind': 'msc', 'exe': 'CL.EXE'},
    'msc4': {'root': REPO_ROOT / 'msc4', 'kind': 'msc', 'exe': 'CL.EXE'},
    'tcpp1': {'root': Path('/home/xor/inertia_player/dos_compilers/Borland Turbo C++ v1'), 'kind': 'tcc', 'exe': 'TCC.EXE'},
    'tc2': {'root': Path('/home/xor/inertia_player/dos_compilers/Borland Turbo C v2'), 'kind': 'tcc', 'exe': 'TCC.EXE'},
    'bcc31': {'root': REPO_ROOT / 'BorlandC', 'kind': 'bcc', 'exe': 'BCC.EXE'},
}


def read_bytes(path: Path) -> bytes:
    return path.read_bytes()


def bytes_to_latin1_text(data: bytes) -> str:
    # 1:1 byte-to-char mapping, preserving original bytes and CRLF in string form.
    return data.decode('latin1', errors='strict')


def strip_comments_preserve_layout(data: bytes) -> bytes:
    out = bytearray()
    i = 0
    n = len(data)
    in_str = False
    in_chr = False
    in_line = False
    in_block = False
    esc = False
    while i < n:
        c = data[i]
        nxt = data[i + 1] if i + 1 < n else None

        if in_line:
            if c in (10, 13):  # keep line endings
                out.append(c)
                in_line = False
            else:
                out.append(32)
            i += 1
            continue

        if in_block:
            if c == 42 and nxt == 47:  # */
                out.extend(b'  ')
                i += 2
                in_block = False
            else:
                if c in (10, 13):
                    out.append(c)
                else:
                    out.append(32)
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

    return bytes(out)


def safe_for_format(data: bytes) -> bool:
    lo = data.lower()
    return not any(t in lo for t in RISKY_TOKENS)


def collapse_blank_lines_latin1(s: str, max_blank: int = 1) -> str:
    out = []
    blank = 0
    lines = re.split(r'(\r\n|\n|\r)', s)
    i = 0
    while i < len(lines):
        line = lines[i]
        sep = lines[i + 1] if i + 1 < len(lines) else ''
        i += 2
        is_blank = (line.strip() == '')
        if is_blank:
            blank += 1
        else:
            blank = 0
        if (not is_blank) or blank <= max_blank:
            out.append(line + sep)
    return ''.join(out)


def aggressive_split_ops_latin1(s: str) -> str:
    # Aggressive readability variant. Not compile-guaranteed.
    for op in ['&&', '||', '==', '!=', '<=', '>=', '+', '-', '*', '/', '%', '&', '|', '^']:
        s = s.replace(f' {op} ', f' \\n{op} ')
    return s


def llm4d_hex_to_dec(text: str) -> str:
    pat = re.compile(r'\b(0x[0-9a-fA-F]+)([uUlL]{1,3})?\b')
    def cv(m):
        return str(int(m.group(1), 16)) + (m.group(2) or '')
    return pat.sub(cv, text)


def llm4d_remove_keywords(text: str) -> str:
    return re.sub(r'\b(__fastcall|__cdecl|__ptr32|__noreturn\s+noreturn)\b', '', text)


def llm4d_replace_typedefs(text: str) -> str:
    for alias, original in LLM4D_TYPEDEF_MAP.items():
        text = re.sub(rf'\b{re.escape(alias)}\b', original, text)
    return text


def llm4d_strip_empty(text: str) -> str:
    return '\n'.join(line for line in text.splitlines() if line.strip())


def llm4d_good_func(text: str) -> bool:
    func = '{'.join(text.split('{')[1:])
    total = 0
    for line in func.splitlines():
        if len(line.strip()) >= 3:
            total += 1
    return 3 < total < 300


def llm4d_normalize_variant(text: str) -> tuple[str | None, str | None]:
    s = re.sub(r'/\*.*?\*/', '', text, flags=re.S)
    s = re.sub(r'//.*?$', '', s, flags=re.M)
    s = llm4d_hex_to_dec(s)
    s = llm4d_remove_keywords(s)
    s = llm4d_replace_typedefs(s)
    s = llm4d_strip_empty(s)
    if not s.strip():
        return None, 'llm4d_empty_after_normalize'
    if not llm4d_good_func(s):
        return None, 'llm4d_filtered_good_func'
    return s + '\n', None


def extract_functions_c_latin1(text: str):
    # Linear-time top-level function extractor for old C/C++ sources.
    out = []
    n = len(text)
    i = 0
    depth = 0
    in_str = in_chr = in_line = in_block = False
    esc = False
    top_open = None
    top_header_start = 0
    while i < n:
        c = text[i]
        nxt = text[i + 1] if i + 1 < n else ''
        if in_line:
            if c in '\r\n':
                in_line = False
            i += 1
            continue
        if in_block:
            if c == '*' and nxt == '/':
                in_block = False
                i += 2
            else:
                i += 1
            continue
        if in_str:
            if esc:
                esc = False
            elif c == '\\':
                esc = True
            elif c == '"':
                in_str = False
            i += 1
            continue
        if in_chr:
            if esc:
                esc = False
            elif c == '\\':
                esc = True
            elif c == "'":
                in_chr = False
            i += 1
            continue
        if c == '/' and nxt == '/':
            in_line = True
            i += 2
            continue
        if c == '/' and nxt == '*':
            in_block = True
            i += 2
            continue
        if c == '"':
            in_str = True
            i += 1
            continue
        if c == "'":
            in_chr = True
            i += 1
            continue

        if c == '{':
            if depth == 0:
                top_open = i
                j = i - 1
                while j > 0 and text[j] in ' \t\r\n':
                    j -= 1
                while j > 0 and text[j] not in '};\r\n':
                    j -= 1
                top_header_start = j + 1
            depth += 1
        elif c == '}':
            if depth > 0:
                depth -= 1
                if depth == 0 and top_open is not None:
                    block_start = top_header_start
                    block_end = i + 1
                    header = text[block_start:top_open]
                    m = re.search(r'([A-Za-z_][A-Za-z0-9_]*)\s*\([^{};]*\)\s*$', header, flags=re.S)
                    bad = re.search(r'\b(if|for|while|switch|else)\s*\([^)]*\)\s*$', header, flags=re.S)
                    if m and not bad:
                        out.append({
                            'name': m.group(1),
                            'start': block_start,
                            'end': block_end,
                            'text': text[block_start:block_end],
                        })
                    top_open = None
        i += 1
    return out


def run_formatter(data: bytes, ext: str, formatter: str, formatter_bin: str | None, timeout_sec: int) -> tuple[bytes | None, str | None]:
    if formatter == 'none':
        return None, None

    with tempfile.TemporaryDirectory(prefix='dosfmt_') as td:
        p = Path(td) / (f'input{ext}')
        p.write_bytes(data)

        if formatter == 'indent':
            exe = formatter_bin or 'indent'
            if shutil.which(exe) is None:
                return None, f'formatter_missing:{exe}'
            cmd = [exe, '-kr', '-npro', str(p)]
            try:
                subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=timeout_sec, check=False)
            except subprocess.TimeoutExpired:
                return None, 'formatter_timeout'
            return p.read_bytes(), None

        if formatter == 'clang-format':
            exe = formatter_bin or 'clang-format'
            if shutil.which(exe) is None:
                return None, f'formatter_missing:{exe}'
            cmd = [exe, '--style=llvm', str(p)]
            try:
                r = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=timeout_sec, check=False)
            except subprocess.TimeoutExpired:
                return None, 'formatter_timeout'
            if r.returncode != 0:
                return None, 'formatter_error'
            return r.stdout, None

    return None, 'formatter_unknown'


def load_build_map(report_path: Path | None):
    if not report_path or not report_path.exists():
        return {}
    obj = json.loads(report_path.read_text(encoding='utf-8'))
    out = {}
    for rec in obj.get('results', []):
        out[rec.get('file')] = {
            'success': bool(rec.get('success')),
            'compiler': rec.get('compiler'),
            'variant': rec.get('variant'),
            'attempts': rec.get('attempts', []),
        }
    return out


def find_exe(tc_root: Path, exe_name: str) -> str | None:
    for c in (tc_root / 'BIN' / exe_name, tc_root / 'bin' / exe_name, tc_root / exe_name):
        if c.exists():
            return 'D:\\' + str(c.relative_to(tc_root)).replace('/', '\\')
    return None


def installed_toolchains():
    out = {}
    for name, cfg in TOOLCHAINS.items():
        root = cfg['root']
        if not root.exists():
            continue
        exe_dos = find_exe(root, cfg['exe'])
        if exe_dos:
            out[name] = {'root': root, 'kind': cfg['kind'], 'exe_dos': exe_dos}
    return out


def choose_fallback_compiler(rel: str, tcs: dict) -> str | None:
    if rel.startswith('msex/'):
        order = ['msc61', 'msc6', 'msc5', 'msc4', 'bcc31', 'tcpp1', 'tc2']
    else:
        order = ['bcc31', 'tcpp1', 'tc2', 'msc61', 'msc6', 'msc5', 'msc4']
    for c in order:
        if c in tcs:
            return c
    return None


def run_kvikdos(src_bytes: bytes, ext: str, compiler: str, mode: str, tcs: dict, timeout_sec: int) -> tuple[bool, int, str, str | None]:
    if compiler not in tcs or not KVIKDOS.exists():
        return False, -999, '', 'toolchain_or_kvikdos_missing'
    tc = tcs[compiler]
    with tempfile.TemporaryDirectory(prefix='kvik_pre_') as td:
        tdir = Path(td)
        src = tdir / f'SRC{ext.upper()}'
        src.write_bytes(src_bytes)
        src_dos = f'C:\\{src.name}'
        common = [
            str(KVIKDOS),
            f'--mount=c:{tdir}/',
            f'--mount=d:{tc["root"]}/',
            '--drive=c',
            '--cwd-dos=C:\\',
            '--env=PATH=D:\\BIN;D:\\',
            '--env=INCLUDE=D:\\INCLUDE',
            '--env=LIB=D:\\LIB',
        ]
        if mode == 'preprocess':
            if tc['kind'] == 'msc':
                cmd = common + [tc['exe_dos'], '/E', src_dos]
            else:
                cmd = common + [tc['exe_dos'], '-E', src_dos]
        else:
            if tc['kind'] == 'msc':
                cmd = common + [tc['exe_dos'], '/c', '/AS', src_dos]
            elif tc['kind'] == 'bcc':
                cmd = common + [tc['exe_dos'], '-c', '-S', '-nC:\\', src_dos]
            else:
                cmd = common + [tc['exe_dos'], '-c', '-S', '-nC:\\', src_dos]
        try:
            r = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, encoding='latin1', errors='replace', timeout=timeout_sec)
        except subprocess.TimeoutExpired as e:
            out = (e.stdout.decode('latin1', errors='replace') if isinstance(e.stdout, bytes) else str(e.stdout or ''))
            return False, 124, out, 'timeout'
        return r.returncode == 0, r.returncode, r.stdout, None


def compile_matrix(variants: dict, ext: str, compiler: str | None, build_success: bool | None, tcs: dict, timeout_sec: int):
    out = {}
    if not compiler or compiler not in tcs:
        return out
    # Always test original; useful even when historical report said fail.
    order = ['original', 'nocomments', 'pretty', 'preprocessed']
    baseline_ok = None
    baseline_rc = None
    for name in order:
        data = variants.get(name)
        if not data:
            out[name] = {'attempted': False, 'ok': None, 'rc': None, 'error': 'variant_missing', 'parity_vs_original': None}
            continue
        ok, rc, _, err = run_kvikdos(data, ext, compiler, 'compile', tcs, timeout_sec)
        rec = {'attempted': True, 'ok': bool(ok), 'rc': rc, 'error': err, 'parity_vs_original': None}
        out[name] = rec
        if name == 'original':
            baseline_ok = bool(ok)
            baseline_rc = rc
    for name in order:
        if name == 'original' or name not in out or out[name]['ok'] is None or baseline_ok is None:
            continue
        out[name]['parity_vs_original'] = (out[name]['ok'] == baseline_ok)
        out[name]['rc_delta_vs_original'] = (out[name]['rc'] - baseline_rc) if out[name]['rc'] is not None and baseline_rc is not None else None
    out['baseline_from_report'] = build_success
    return out


def iter_sources(dirs: list[str]):
    seen = set()
    for d in dirs:
        base = (REPO_ROOT / d).resolve()
        if not base.exists():
            continue
        for p in base.rglob('*'):
            if not p.is_file() or p.suffix.lower() not in C_EXTS:
                continue
            if p in seen:
                continue
            seen.add(p)
            yield p


def main():
    ap = argparse.ArgumentParser(description='Preprocess DOS C/C++ corpus into LLM-friendly JSONL while preserving raw source bytes.')
    ap.add_argument('--dirs', nargs='+', default=['msex', 'bcex', 'tcex'])
    ap.add_argument('--report', default='artifacts/corpus_cod_build_report.json')
    ap.add_argument('--out', default='artifacts/dos_c_preprocessed.jsonl')
    ap.add_argument('--formatter', choices=['none', 'indent', 'clang-format'], default='indent')
    ap.add_argument('--formatter-bin', default='')
    ap.add_argument('--formatter-timeout', type=int, default=10)
    ap.add_argument('--max-files', type=int, default=0)
    ap.add_argument('--only-buildable', action='store_true')
    ap.add_argument('--keep-empty-pretty', action='store_true', help='Emit rows even when pretty variant is unavailable.')
    ap.add_argument('--verify-format-build', action='store_true')
    ap.add_argument('--macro-expand', choices=['none', 'compiler'], default='none')
    ap.add_argument('--kvik-timeout', type=int, default=30)
    ap.add_argument('--compare-compilation', action='store_true', help='Compile original and each derived variant; record parity matrix.')
    ap.add_argument('--make-compact-variant', action='store_true', help='Create compact variant with duplicate blank lines collapsed.')
    ap.add_argument('--make-aggressive-style-variant', action='store_true', help='Create aggressive operator-split style variant (not compile-guaranteed).')
    ap.add_argument('--llm4d-normalize', action='store_true', help='Add LLM4Decompile-style normalized C variant.')
    ap.add_argument('--one-function-per-row', action='store_true')
    args = ap.parse_args()

    report_path = Path(args.report) if args.report else None
    build_map = load_build_map(report_path)
    tcs = installed_toolchains()
    if report_path and not report_path.exists():
        print(f'warning: report not found, using fallback compiler selection: {report_path}')

    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)

    total = 0
    wrote = 0
    with out.open('w', encoding='utf-8') as w:
        for src in iter_sources(args.dirs):
            total += 1
            if args.max_files > 0 and wrote >= args.max_files:
                break

            rel = src.relative_to(REPO_ROOT).as_posix()
            build = build_map.get(rel, {})
            if args.only_buildable and not build.get('success'):
                continue

            raw = read_bytes(src)
            nocomments = strip_comments_preserve_layout(raw)

            pretty_bytes = None
            pretty_error = None
            if safe_for_format(raw):
                pretty_bytes, pretty_error = run_formatter(
                    nocomments,
                    src.suffix,
                    args.formatter,
                    args.formatter_bin or None,
                    args.formatter_timeout,
                )
            else:
                pretty_error = 'skipped_risky_legacy_tokens'

            if pretty_bytes is None and not args.keep_empty_pretty and args.formatter != 'none':
                # Keep row, but set pretty as nocomments fallback.
                pretty_bytes = nocomments

            compact = None
            aggressive = None
            llm4d_norm = None
            llm4d_norm_error = None
            raw_text_latin1 = bytes_to_latin1_text(raw)
            nocomments_latin1 = bytes_to_latin1_text(nocomments)
            pretty_latin1 = bytes_to_latin1_text(pretty_bytes) if pretty_bytes is not None else None
            if args.make_compact_variant:
                base = pretty_latin1 if pretty_latin1 is not None else nocomments_latin1
                compact = collapse_blank_lines_latin1(base, max_blank=1)
            if args.make_aggressive_style_variant:
                base = compact if compact is not None else (pretty_latin1 if pretty_latin1 is not None else nocomments_latin1)
                aggressive = aggressive_split_ops_latin1(base)
            if args.llm4d_normalize:
                llm4d_norm, llm4d_norm_error = llm4d_normalize_variant(raw_text_latin1)

            preprocessed = None
            macro_error = None
            compiler = build.get('compiler') or choose_fallback_compiler(rel, tcs)
            if args.macro_expand == 'compiler' and compiler:
                ok_pp, _, pp_out, pp_err = run_kvikdos(raw, src.suffix, compiler, 'preprocess', tcs, args.kvik_timeout)
                if ok_pp:
                    preprocessed = pp_out
                else:
                    macro_error = pp_err or 'preprocess_failed'

            format_compile_ok = None
            format_compile_error = None
            if args.verify_format_build and pretty_bytes is not None and compiler and build.get('success'):
                ok_c, _, _, c_err = run_kvikdos(pretty_bytes, src.suffix, compiler, 'compile', tcs, args.kvik_timeout)
                format_compile_ok = bool(ok_c)
                format_compile_error = c_err

            compilation_matrix = None
            if args.compare_compilation and compiler:
                variants_bin = {
                    'original': raw,
                    'nocomments': nocomments,
                    'pretty': pretty_bytes,
                    'preprocessed': preprocessed.encode('latin1', errors='replace') if preprocessed is not None else None,
                }
                compilation_matrix = compile_matrix(variants_bin, src.suffix, compiler, build.get('success'), tcs, args.kvik_timeout)

            base_row = {
                'path': rel,
                'language': 'c++' if src.suffix.lower() == '.cpp' else 'c',
                'raw': {
                    'sha256': hashlib.sha256(raw).hexdigest(),
                    'size_bytes': len(raw),
                    'encoding': 'binary-preserved',
                    'line_endings': 'original-preserved',
                    'text_latin1': raw_text_latin1,
                },
                'variants': {
                    'nocomments_latin1': nocomments_latin1,
                    'pretty_latin1': pretty_latin1,
                    'preprocessed_latin1': preprocessed,
                    'compact_latin1': compact,
                    'aggressive_style_latin1': aggressive,
                    'llm4d_norm_latin1': llm4d_norm,
                },
                'transforms': {
                    'comments_removed': True,
                    'formatter': args.formatter,
                    'formatter_error': pretty_error,
                    'macro_expand': args.macro_expand,
                    'macro_expand_error': macro_error,
                    'format_compile_ok': format_compile_ok,
                    'format_compile_error': format_compile_error,
                    'compact_variant': bool(args.make_compact_variant),
                    'aggressive_style_variant': bool(args.make_aggressive_style_variant),
                    'aggressive_style_compile_guaranteed': False,
                    'llm4d_normalize': bool(args.llm4d_normalize),
                    'llm4d_normalize_error': llm4d_norm_error,
                    'source_files_unchanged': True,
                },
                'build_context': build,
                'compilation_matrix': compilation_matrix,
            }

            if args.one_function_per_row:
                funcs = extract_functions_c_latin1(raw_text_latin1)
                if not funcs:
                    row = dict(base_row)
                    row['id'] = f'{rel}#file'
                    row['function'] = {'name': '__file__', 'start': 0, 'end': len(raw_text_latin1), 'text_latin1': raw_text_latin1}
                    w.write(json.dumps(row, ensure_ascii=False) + '\n')
                    wrote += 1
                else:
                    for idx, fn in enumerate(funcs, start=1):
                        row = dict(base_row)
                        row['id'] = f"{rel}#fn{idx}:{fn['name']}"
                        row['function'] = {
                            'name': fn['name'],
                            'start': fn['start'],
                            'end': fn['end'],
                            'text_latin1': fn['text'],
                        }
                        w.write(json.dumps(row, ensure_ascii=False) + '\n')
                        wrote += 1
            else:
                row = dict(base_row)
                row['id'] = rel
                w.write(json.dumps(row, ensure_ascii=False) + '\n')
                wrote += 1

    print(f'Wrote {wrote} rows (scanned {total}) to {out}')


if __name__ == '__main__':
    main()
