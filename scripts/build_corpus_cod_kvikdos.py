#!/usr/bin/env python3
import argparse
import itertools
import json
import os
import shutil
import subprocess
import hashlib
from concurrent.futures import ThreadPoolExecutor, as_completed
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

DEFAULT_ORDER = ['msc61', 'msc6', 'msc5', 'msc4', 'bcc31', 'tcpp1', 'tc2']
DEFAULT_EXTS = {'.C', '.CPP'}

# Conservative defaults that avoid source edits.
DEFAULT_FLAGS = {
    'msc': ['/AS'],
    'tcc': ['-S'],
    'bcc': ['-S'],
}

VARIANT_FLAGS = {
    'msc': [[], ['/Od']],
    'tcc': [[], ['-ml'], ['-ms']],
    'bcc': [[], ['-ml'], ['-ms']],
}


def load_flag_matrix(path: str | None):
    if not path:
        return VARIANT_FLAGS
    p = Path(path)
    if not p.exists():
        raise SystemExit(f'flag matrix not found: {p}')
    raw = json.loads(p.read_text(encoding='utf-8'))
    out = {}
    for kind, spec in raw.items():
        mode = spec.get('mode', 'list')
        if mode == 'list':
            out[kind] = spec.get('variants', [[]])
            continue
        groups = spec.get('groups', [])
        combos = []
        choices = [g.get('choices', [[]]) for g in groups]
        for prod in itertools.product(*choices):
            merged = []
            for part in prod:
                merged.extend(part)
            combos.append(merged)
        out[kind] = combos or [[]]
    return out


def find_exe(tc_root: Path, exe_name: str) -> str | None:
    candidates = [
        tc_root / 'BIN' / exe_name,
        tc_root / 'bin' / exe_name,
        tc_root / exe_name,
    ]
    for c in candidates:
        if c.exists():
            rel = c.relative_to(tc_root)
            return 'D:\\' + str(rel).replace('/', '\\')
    return None


def installed_toolchains():
    out = {}
    for name, cfg in TOOLCHAINS.items():
        root = Path(cfg['root'])
        exe_dos = find_exe(root, cfg['exe']) if root.exists() else None
        if exe_dos:
            out[name] = {
                'root': root,
                'kind': cfg['kind'],
                'exe_dos': exe_dos,
            }
    return out


def maybe_include_flags(src_dir: Path, kind: str, mount_root: Path):
    flags = []
    candidates = set()
    cur = src_dir
    while True:
        candidates.add(cur / 'include')
        candidates.add(cur / 'INCLUDE')
        if cur == mount_root or cur.parent == cur:
            break
        cur = cur.parent
    for child in mount_root.iterdir():
        if child.is_dir() and child.name.lower() == 'include':
            candidates.add(child)

    for cand in sorted(candidates):
        if cand.exists() and cand.is_dir():
            rel = Path(os.path.relpath(cand, src_dir))
            dos = 'C:\\' + str(rel).replace('/', '\\') if str(rel) != '.' else 'C:\\'
            if kind == 'msc':
                flags.append(f'/I{dos}')
            else:
                flags.append(f'-I{dos}')
    return flags


def choose_mount_root(src_file: Path, repo_root: Path):
    section_root = None
    rel = src_file.relative_to(repo_root)
    if rel.parts:
        section_root = repo_root / rel.parts[0]
    cur = src_file.parent
    best = src_file.parent
    markers = {'makefile', '.mak', '.prj'}
    while True:
        has_include = (cur / 'include').is_dir() or (cur / 'INCLUDE').is_dir()
        has_marker = any(
            p.is_file() and (p.name.lower() == 'makefile' or p.suffix.lower() in markers)
            for p in cur.iterdir()
        ) if cur.exists() else False
        if has_include or has_marker:
            best = cur
        if cur == section_root or cur == repo_root or cur.parent == cur:
            break
        cur = cur.parent
    return best


def compile_with_tc(src_file: Path, src_root: Path, tc_name: str, tc_cfg: dict, extra_flags: list[str], timeout_sec: int):
    def _timeout_out(o):
        if o is None:
            return ''
        if isinstance(o, bytes):
            return o.decode('latin1', errors='replace')
        return str(o)
    rel = src_file.relative_to(src_root)
    mount_root = choose_mount_root(src_file, src_root)
    src_dir = src_file.parent
    src_name = src_file.name
    src_rel_from_mount = src_file.relative_to(mount_root)
    src_dos = 'C:\\' + str(src_rel_from_mount).replace('/', '\\')
    cwd_dos = 'C:\\' + str(src_dir.relative_to(mount_root)).replace('/', '\\') if src_dir != mount_root else 'C:\\'
    cod_path = src_file.with_suffix('.COD')

    # DOS 8.3 compatibility staging for long/space-heavy names.
    use_stage = False
    for p in src_rel_from_mount.parts:
        base, _, ext = p.partition('.')
        if ' ' in p or len(base) > 8 or (ext and len(ext) > 3):
            use_stage = True
            break
    force_stage = any(x in src_file.as_posix() for x in ['/GOTsource/', '/xargon/SOURCE/', '/KiloBlaster/SOURCE/'])
    if force_stage:
        use_stage = True

    if use_stage:
        sid = hashlib.md5(str(src_file).encode('utf-8')).hexdigest()[:8]
        stage_dir = src_root / 'artifacts' / 'stage83' / sid
        stage_dir.mkdir(parents=True, exist_ok=True)
        staged_src = stage_dir / ('SRC' + src_file.suffix.upper())

        # Legacy trees often use absolute DOS includes (\develop\xargon\include\...).
        if '/xargon/SOURCE/' in src_file.as_posix():
            dsrc = stage_dir / 'develop' / 'xargon' / 'source'
            dinc = stage_dir / 'develop' / 'xargon' / 'include'
            dsrc.mkdir(parents=True, exist_ok=True)
            dinc.mkdir(parents=True, exist_ok=True)
            staged_src = dsrc / ('SRC' + src_file.suffix.upper())
            shutil.copyfile(src_file, staged_src)
            for h in (src_file.parent.parent / 'INCLUDE').glob('*'):
                if h.is_file():
                    shutil.copyfile(h, dinc / h.name)
                    if h.name.lower() != h.name:
                        shutil.copyfile(h, dinc / h.name.lower())
        elif '/KiloBlaster/SOURCE/' in src_file.as_posix():
            dsrc = stage_dir / 'develop' / 'kilo2' / 'source'
            dinc = stage_dir / 'develop' / 'kilo2' / 'include'
            dsrc.mkdir(parents=True, exist_ok=True)
            dinc.mkdir(parents=True, exist_ok=True)
            staged_src = dsrc / ('SRC' + src_file.suffix.upper())
            shutil.copyfile(src_file, staged_src)
            for h in (src_file.parent.parent / 'INCLUDE').glob('*'):
                if h.is_file():
                    shutil.copyfile(h, dinc / h.name)
                    if h.name.lower() != h.name:
                        shutil.copyfile(h, dinc / h.name.lower())
        else:
            shutil.copyfile(src_file, staged_src)
            for pat in ('*.H', '*.h', '*.INC', '*.inc'):
                for h in src_dir.glob(pat):
                    try:
                        shutil.copyfile(h, stage_dir / h.name)
                        if h.name.lower() != h.name:
                            shutil.copyfile(h, stage_dir / h.name.lower())
                    except Exception:
                        pass

        mount_root = stage_dir
        src_dir = staged_src.parent
        src_name = staged_src.name
        src_dos = 'C:\\' + str(staged_src.relative_to(stage_dir)).replace('/', '\\')
        cwd_dos = 'C:\\' + str(staged_src.parent.relative_to(stage_dir)).replace('/', '\\') if staged_src.parent != stage_dir else 'C:\\'

    kind = tc_cfg['kind']
    exe_dos = tc_cfg['exe_dos']

    common = [
        str(KVIKDOS),
        f'--mount=c:{mount_root}/',
        f"--mount=d:{tc_cfg['root']}/",
        '--drive=c',
        f'--cwd-dos={cwd_dos}',
    ]

    if kind == 'msc':
        cmd = common + [
            '--env=PATH=D:\\BIN;D:\\',
            '--env=INCLUDE=D:\\INCLUDE',
            '--env=LIB=D:\\LIB',
            exe_dos,
            '/c',
            *DEFAULT_FLAGS['msc'],
            *maybe_include_flags(src_dir, 'msc', mount_root),
            *extra_flags,
            f'/FcC:\\{cod_path.name}',
            src_dos,
        ]
        try:
            res = subprocess.run(cmd, cwd=str(src_root), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, encoding='latin1', errors='replace', timeout=timeout_sec)
        except subprocess.TimeoutExpired as e:
            return False, 124, _timeout_out(e.stdout) + '\n[TIMEOUT]'
        if use_stage:
            staged_cod = mount_root / ('SRC.COD')
            if staged_cod.exists() and not cod_path.exists():
                shutil.copyfile(staged_cod, cod_path)
        ok = cod_path.exists() and cod_path.stat().st_size > 0
        return ok, res.returncode, res.stdout

    asm_path = src_file.with_suffix('.ASM')
    if kind == 'bcc':
        cmd = common + [
            '--env=PATH=D:\\BIN;D:\\',
            '--env=INCLUDE=D:\\INCLUDE',
            '--env=LIB=D:\\LIB',
            exe_dos,
            '-c',
            *DEFAULT_FLAGS['bcc'],
            *maybe_include_flags(src_dir, 'bcc', mount_root),
            *extra_flags,
            f'-nC:\\{asm_path.name}',
            src_dos,
        ]
        try:
            res = subprocess.run(cmd, cwd=str(src_root), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, encoding='latin1', errors='replace', timeout=timeout_sec)
        except subprocess.TimeoutExpired as e:
            return False, 124, _timeout_out(e.stdout) + '\n[TIMEOUT]'
        if use_stage:
            staged_asm = mount_root / ('SRC.ASM')
            if staged_asm.exists() and not cod_path.exists():
                shutil.copyfile(staged_asm, cod_path)
        elif asm_path.exists() and (not cod_path.exists()):
            shutil.copyfile(asm_path, cod_path)
        ok = cod_path.exists() and cod_path.stat().st_size > 0
        return ok, res.returncode, res.stdout

    cmd = common + [
        '--env=PATH=D:\\BIN;D:\\',
        '--env=INCLUDE=D:\\INCLUDE',
        '--env=LIB=D:\\LIB',
        exe_dos,
        '-c',
        *DEFAULT_FLAGS['tcc'],
        *maybe_include_flags(src_dir, 'tcc', mount_root),
        *extra_flags,
        f'-nC:\\{asm_path.name}',
            src_dos,
    ]
    try:
        res = subprocess.run(cmd, cwd=str(src_root), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, encoding='latin1', errors='replace', timeout=timeout_sec)
    except subprocess.TimeoutExpired as e:
        return False, 124, _timeout_out(e.stdout) + '\n[TIMEOUT]'
    if use_stage:
        staged_asm = mount_root / ('SRC.ASM')
        if staged_asm.exists() and not cod_path.exists():
            shutil.copyfile(staged_asm, cod_path)
    elif asm_path.exists() and (not cod_path.exists()):
        shutil.copyfile(asm_path, cod_path)
    ok = cod_path.exists() and cod_path.stat().st_size > 0
    return ok, res.returncode, res.stdout


def collect_sources(repo_root: Path, dirs: list[str], max_files: int, offset: int):
    files = []
    for d in dirs:
        base = repo_root / d
        if not base.exists():
            continue
        for ext in DEFAULT_EXTS:
            files.extend(base.rglob(f'*{ext}'))
    files = sorted(set(files))
    if offset > 0:
        files = files[offset:]
    if max_files > 0:
        files = files[:max_files]
    return files


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--dirs', nargs='+', default=['msex', 'bcex', 'tcex'])
    ap.add_argument('--max-files', type=int, default=0)
    ap.add_argument('--offset', type=int, default=0)
    ap.add_argument('--clean', action='store_true')
    ap.add_argument('--report', default='artifacts/corpus_cod_build_report.json')
    ap.add_argument('--log', default='artifacts/corpus_cod_build.log')
    ap.add_argument('--flag-matrix', default='')
    ap.add_argument('--jobs', type=int, default=1)
    ap.add_argument('--attempt-timeout', type=int, default=45)
    args = ap.parse_args()

    if not KVIKDOS.exists():
        raise SystemExit(f'kvikdos missing: {KVIKDOS}')

    tcs = installed_toolchains()
    variant_flags = load_flag_matrix(args.flag_matrix)
    base_order = [x for x in DEFAULT_ORDER if x in tcs]
    if not base_order:
        raise SystemExit('No toolchains detected')

    src_files = collect_sources(REPO_ROOT, args.dirs, args.max_files, args.offset)
    if args.clean:
        for f in src_files:
            c = f.with_suffix('.COD')
            if c.exists():
                c.unlink()

    Path(args.report).parent.mkdir(parents=True, exist_ok=True)
    results = []
    succ = 0
    fail = 0

    def run_one(src: Path):
        rel = src.relative_to(REPO_ROOT).as_posix()
        if rel.startswith('msex/'):
            order = [x for x in ['msc61', 'msc6', 'msc5', 'msc4', 'bcc31', 'tcpp1', 'tc2'] if x in base_order]
        else:
            order = [x for x in ['bcc31', 'tcpp1', 'tc2', 'msc61', 'msc6', 'msc5', 'msc4'] if x in base_order]
        entry = {'file': rel, 'success': False, 'compiler': None, 'variant': None, 'attempts': [], 'logs': []}
        for tc in order:
            kind = tcs[tc]['kind']
            for vflags in variant_flags.get(kind, [[]]):
                ok, rc, out = compile_with_tc(src, REPO_ROOT, tc, tcs[tc], vflags, args.attempt_timeout)
                entry['attempts'].append({'compiler': tc, 'flags': vflags, 'rc': rc})
                entry['logs'].append(f"===== {rel} :: {tc} flags={vflags} rc={rc} =====\\n{out}\\n")
                if ok:
                    entry['success'] = True
                    entry['compiler'] = tc
                    entry['variant'] = vflags
                    return entry
        return entry

    with Path(args.log).open('w', encoding='utf-8') as logf:
        if args.jobs <= 1:
            iterable = [(i, run_one(src)) for i, src in enumerate(src_files, start=1)]
        else:
            iterable = []
            with ThreadPoolExecutor(max_workers=args.jobs) as ex:
                fut_map = {ex.submit(run_one, src): i for i, src in enumerate(src_files, start=1)}
                for fut in as_completed(fut_map):
                    iterable.append((fut_map[fut], fut.result()))
            iterable.sort(key=lambda x: x[0])

        for i, entry in iterable:
            for l in entry.pop('logs'):
                logf.write(l + "\n")
            if entry['success']:
                succ += 1
            if not entry['success']:
                fail += 1
            results.append(entry)
            print(f"[{i}/{len(src_files)}] {'OK' if entry['success'] else 'FAIL'} {entry['file']} ({entry['compiler'] or 'none'})")

    summary = {
        'dirs': args.dirs,
        'total_files': len(src_files),
        'success': succ,
        'failed': fail,
        'toolchains': base_order,
        'results': results,
    }
    Path(args.report).write_text(json.dumps(summary, indent=2), encoding='utf-8')
    print(f'Done. success={succ} failed={fail}')
    print(f'Report: {args.report}')
    print(f'Log: {args.log}')


if __name__ == '__main__':
    main()
