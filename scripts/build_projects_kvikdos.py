#!/usr/bin/env python3
import argparse
import json
import subprocess
from pathlib import Path

REPO = Path('/home/xor/nndecomp')
KVIKDOS = Path('/home/xor/kvikdos/kvikdos')

TOOLCHAINS = {
    'msc61': {'root': REPO / 'msc61', 'kind': 'msc', 'make': 'NMAKE.EXE'},
    'msc6': {'root': REPO / 'msc60', 'kind': 'msc', 'make': 'NMAKE.EXE'},
    'msc5': {'root': REPO / 'msc5', 'kind': 'msc', 'make': 'NMAKE.EXE'},
    'bcc31': {'root': REPO / 'BorlandC', 'kind': 'bcc', 'make': 'MAKE.EXE'},
    'tcpp1': {'root': Path('/home/xor/inertia_player/dos_compilers/Borland Turbo C++ v1'), 'kind': 'tcc', 'make': 'MAKE.EXE'},
    'tc2': {'root': REPO / 'tc2', 'kind': 'tcc', 'make': 'MAKE.EXE'},
}


def find_exe(root: Path, exe: str):
    for p in [root / 'BIN' / exe, root / exe, root / 'bin' / exe]:
        if p.exists():
            rel = p.relative_to(root)
            return 'D:\\' + str(rel).replace('/', '\\')
    return None


def detect_projects(dirs):
    roots = []
    for top in dirs:
        for d in (REPO / top).rglob('*'):
            if not d.is_dir():
                continue
            files = [p for p in d.iterdir() if p.is_file()]
            names = [f.name.lower() for f in files]
            if any(n == 'makefile' or n.endswith('.mak') or n.endswith('.prj') or n.endswith('.bat') for n in names):
                if '/OBJS/' in d.as_posix() or d.name.lower() == 'objs':
                    continue
                roots.append(d)
    uniq = []
    seen = set()
    for r in sorted(roots):
        s = r.as_posix()
        if s not in seen:
            seen.add(s)
            uniq.append(r)
    return uniq


def run_kvik(cwd: Path, tc: str, argv):
    cfg = TOOLCHAINS[tc]
    cmd = [
        str(KVIKDOS),
        f'--mount=c:{cwd}/',
        f"--mount=d:{cfg['root']}/",
        '--env=PATH=D:\\BIN;D:\\',
        '--env=INCLUDE=D:\\INCLUDE',
        '--env=LIB=D:\\LIB',
        '--drive=c',
        '--cwd-dos=C:\\',
    ] + argv
    res = subprocess.run(cmd, cwd=str(REPO), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    return res.returncode, res.stdout


def commands_for_project(proj: Path, tc: str):
    files = [p for p in proj.iterdir() if p.is_file()]
    names = [f.name for f in files]
    cmds = []

    bat = [n for n in names if n.lower().endswith('.bat')]
    mak = [n for n in names if n.lower() == 'makefile' or n.lower().endswith('.mak')]

    make_exe = find_exe(TOOLCHAINS[tc]['root'], TOOLCHAINS[tc]['make'])
    if make_exe and mak:
        for m in mak[:2]:
            cmds.append([make_exe, '-f', f'C:\\{m}'])

    if bat:
        for b in bat[:2]:
            cmds.append([f'C:\\{b}'])

    return cmds


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--dirs', nargs='+', default=['msex', 'bcex', 'tcex'])
    ap.add_argument('--report', default='artifacts/project_build_report.json')
    ap.add_argument('--log', default='artifacts/project_build.log')
    ap.add_argument('--max-projects', type=int, default=0)
    args = ap.parse_args()

    projects = detect_projects(args.dirs)
    if args.max_projects > 0:
        projects = projects[:args.max_projects]

    tcs = [k for k in ['bcc31', 'tcpp1', 'tc2', 'msc61', 'msc6', 'msc5'] if TOOLCHAINS[k]['root'].exists()]
    results = []

    Path(args.report).parent.mkdir(parents=True, exist_ok=True)
    with Path(args.log).open('w', encoding='utf-8') as lg:
        for i, proj in enumerate(projects, start=1):
            rel = proj.relative_to(REPO).as_posix()
            ok = False
            rec = {'project': rel, 'success': False, 'toolchain': None, 'attempts': []}
            for tc in tcs:
                cmds = commands_for_project(proj, tc)
                for c in cmds:
                    rc, out = run_kvik(proj, tc, c)
                    rec['attempts'].append({'toolchain': tc, 'cmd': c, 'rc': rc})
                    lg.write(f"===== {rel} :: {tc} :: {' '.join(c)} rc={rc} =====\n{out}\n\n")
                    if rc == 0:
                        ok = True
                        rec['success'] = True
                        rec['toolchain'] = tc
                        break
                if ok:
                    break
            results.append(rec)
            print(f"[{i}/{len(projects)}] {'OK' if ok else 'FAIL'} {rel} ({rec['toolchain'] or 'none'})")

    summary = {
        'total_projects': len(projects),
        'success': sum(1 for r in results if r['success']),
        'failed': sum(1 for r in results if not r['success']),
        'results': results,
    }
    Path(args.report).write_text(json.dumps(summary, indent=2), encoding='utf-8')
    print(f"Done. success={summary['success']} failed={summary['failed']}")
    print(f"Report: {args.report}")
    print(f"Log: {args.log}")


if __name__ == '__main__':
    main()
