#!/usr/bin/env python3
import argparse
import hashlib
import itertools
import json
import re
import shutil
import subprocess
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
KVIKDOS = Path('/home/xor/kvikdos/kvikdos')

TOOLCHAINS = {
    'msc61': {'root': REPO_ROOT / 'msc61', 'kind': 'msc', 'exe': 'CL.EXE'},
    'msc6': {'root': REPO_ROOT / 'msc60', 'kind': 'msc', 'exe': 'CL.EXE'},
    'msc5': {'root': REPO_ROOT / 'msc5', 'kind': 'msc', 'exe': 'CL.EXE'},
    'msc4': {'root': REPO_ROOT / 'msc4', 'kind': 'msc', 'exe': 'CL.EXE'},
    'tcpp1': {'root': Path('/home/xor/inertia_player/dos_compilers/Borland Turbo C++ v1'), 'kind': 'tcc', 'exe': 'TCC.EXE'},
    'tc2': {'root': Path('/home/xor/inertia_player/dos_compilers/Borland Turbo C v2'), 'kind': 'tcc', 'exe': 'TCC.EXE'},
    'bcc31': {'root': REPO_ROOT / 'BorlandC', 'kind': 'bcc', 'exe': 'BCC.EXE'},
}

# Compatibility-aware defaults inspired by bruteflags.py and MSC docs.
MSC_GROUPS = {
    'opt_base': ['/Od', '/Os', '/Ot', '/Ox'],           # choose exactly one
    'opt_toggles': ['/Ol', '/On', '/Or', '/Oa', '/Oi'], # optional independent
    'codegen': ['/Gs'],                                  # optional
    'debug': ['', '/Zi'],                                # choose at most one
}

TCC_GROUPS = {
    'model': ['', '-ms', '-mm', '-ml'],
    'opt_base': ['', '-O', '-O2'],
    'debug': ['', '-v'],
}

BCC_GROUPS = {
    'model': ['', '-ms', '-mm', '-ml'],
    'opt_base': ['', '-O', '-O2'],
    'debug': ['', '-v'],
}


def find_exe(tc_root: Path, exe_name: str) -> str | None:
    for c in (tc_root / 'BIN' / exe_name, tc_root / 'bin' / exe_name, tc_root / exe_name):
        if c.exists():
            return 'D:\\' + str(c.relative_to(tc_root)).replace('/', '\\')
    return None


def normalize_asm_text(text: str) -> str:
    out = []
    for ln in text.splitlines():
        s = ln.strip()
        if not s:
            continue
        if s.startswith(';|***'):
            continue
        m = re.match(r'^\*\*\*\s+[0-9A-Fa-f]+\s+[0-9A-Fa-f][0-9A-Fa-f ]+\s+(.*)$', s)
        if m:
            s = m.group(1).strip()
        s = re.sub(r'^\s*[0-9A-Fa-f]{1,6}:[0-9A-Fa-f]{1,8}\s+', '', s)
        s = re.sub(r'\$[A-Za-z0-9_.$?@]+', 'LBL', s)
        out.append(s)
    return '\n'.join(out)


def canonical_flag_string(flags: list[str]) -> str:
    flags = [f for f in flags if f]
    return ' '.join(sorted(set(flags), key=lambda x: x.lower()))


def generate_flag_sets(kind: str, max_combos: int = 0):
    combos = []
    if kind == 'msc':
        for base in MSC_GROUPS['opt_base']:
            for n in range(0, len(MSC_GROUPS['opt_toggles']) + 1):
                for opt in itertools.combinations(MSC_GROUPS['opt_toggles'], n):
                    for dbg in MSC_GROUPS['debug']:
                        for cg in ([''], MSC_GROUPS['codegen'])[1]:
                            flags = [base, *opt, dbg, cg]
                            combos.append(canonical_flag_string(flags))
    elif kind == 'tcc':
        for m in TCC_GROUPS['model']:
            for o in TCC_GROUPS['opt_base']:
                for d in TCC_GROUPS['debug']:
                    combos.append(canonical_flag_string([m, o, d]))
    else:
        for m in BCC_GROUPS['model']:
            for o in BCC_GROUPS['opt_base']:
                for d in BCC_GROUPS['debug']:
                    combos.append(canonical_flag_string([m, o, d]))

    combos = sorted(set(combos))
    if max_combos > 0:
        combos = combos[:max_combos]
    return combos


def compile_one(src: Path, tc_name: str, flags: str, outdir: Path, timeout_sec: int):
    tc = TOOLCHAINS[tc_name]
    exe_dos = find_exe(tc['root'], tc['exe'])
    if not exe_dos:
        return {'ok': False, 'error': 'compiler_not_found'}

    src_dir = src.parent
    src_name = src.name
    kind = tc['kind']
    suffix = '.ASM' if kind in {'msc', 'tcc', 'bcc'} else '.COD'

    tag = re.sub(r'[^A-Za-z0-9]+', '_', flags).strip('_') or 'none'
    out_name = f'output_{tag}.COD'
    out_path = outdir / out_name

    common = [
        str(KVIKDOS),
        f'--mount=c:{src_dir}/',
        f'--mount=d:{tc["root"]}/',
        '--drive=c',
        '--cwd-dos=C:\\',
        '--env=PATH=D:\\BIN;D:\\',
        '--env=INCLUDE=D:\\INCLUDE',
        '--env=LIB=D:\\LIB',
    ]

    flag_list = [x for x in flags.split() if x]
    if kind == 'msc':
        cmd = common + [exe_dos, '/c', '/AS', *flag_list, f'/FaC:\\{src.with_suffix(suffix).name}', f'C:\\{src_name}']
    else:
        cmd = common + [exe_dos, '-c', '-S', *flag_list, '-nC:\\', f'C:\\{src_name}']

    try:
        r = subprocess.run(cmd, cwd=str(REPO_ROOT), stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                           text=True, encoding='latin1', errors='replace', timeout=timeout_sec)
    except subprocess.TimeoutExpired as e:
        return {'ok': False, 'flags': flags, 'rc': 124, 'stdout': str(e.stdout or ''), 'error': 'timeout'}

    asm_path = src.with_suffix(suffix)
    if not asm_path.exists() and kind in {'tcc', 'bcc'}:
        asm_path = src.with_suffix('.OBJ')
    if not asm_path.exists():
        return {'ok': False, 'flags': flags, 'rc': r.returncode, 'stdout': r.stdout, 'error': 'no_output'}

    data = asm_path.read_bytes()
    out_path.write_bytes(data)
    raw_md5 = hashlib.md5(data).hexdigest()
    norm_md5 = hashlib.md5(normalize_asm_text(data.decode('latin1', errors='replace')).encode('utf-8')).hexdigest()

    return {
        'ok': True,
        'flags': flags,
        'rc': r.returncode,
        'output': out_path.as_posix(),
        'raw_md5': raw_md5,
        'norm_md5': norm_md5,
        'size': len(data),
    }


def main():
    ap = argparse.ArgumentParser(description='Compile one source across compatible flag combinations and deduplicate outputs.')
    ap.add_argument('--source', required=True)
    ap.add_argument('--compiler', default='msc61', choices=list(TOOLCHAINS.keys()))
    ap.add_argument('--outdir', default='artifacts/flag_matrix_outputs')
    ap.add_argument('--max-combos', type=int, default=0)
    ap.add_argument('--timeout', type=int, default=20)
    ap.add_argument('--keep-mode', choices=['raw', 'normalized', 'both'], default='both')
    args = ap.parse_args()

    src = Path(args.source).resolve()
    outdir = Path(args.outdir).resolve()
    outdir.mkdir(parents=True, exist_ok=True)

    kind = TOOLCHAINS[args.compiler]['kind']
    combos = generate_flag_sets(kind, args.max_combos)

    results = []
    by_raw = {}
    by_norm = {}
    kept = []

    for i, fs in enumerate(combos, start=1):
        r = compile_one(src, args.compiler, fs, outdir, args.timeout)
        r['idx'] = i
        results.append(r)
        if not r.get('ok'):
            continue
        raw = r['raw_md5']
        norm = r['norm_md5']
        dup_raw = raw in by_raw
        dup_norm = norm in by_norm
        keep = True
        if args.keep_mode == 'raw' and dup_raw:
            keep = False
        elif args.keep_mode == 'normalized' and dup_norm:
            keep = False
        elif args.keep_mode == 'both' and (dup_raw or dup_norm):
            keep = False
        r['dedup_keep'] = keep
        r['dup_raw'] = dup_raw
        r['dup_norm'] = dup_norm
        if keep:
            by_raw[raw] = r['output']
            by_norm[norm] = r['output']
            kept.append(r)
        else:
            try:
                Path(r['output']).unlink(missing_ok=True)
            except Exception:
                pass

    report = {
        'source': src.as_posix(),
        'compiler': args.compiler,
        'kind': kind,
        'combos_total': len(combos),
        'success_total': sum(1 for x in results if x.get('ok')),
        'kept_total': len(kept),
        'unique_raw': len(by_raw),
        'unique_normalized': len(by_norm),
        'keep_mode': args.keep_mode,
        'results': results,
    }
    rp = outdir / 'report.json'
    rp.write_text(json.dumps(report, indent=2), encoding='utf-8')
    print(f"Done combos={len(combos)} success={report['success_total']} kept={len(kept)} raw={len(by_raw)} norm={len(by_norm)}")
    print(f'Report: {rp}')


if __name__ == '__main__':
    main()
