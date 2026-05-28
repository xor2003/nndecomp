#!/usr/bin/env python3
import json
import shutil
import subprocess
from pathlib import Path

REPO = Path('/home/xor/nndecomp')
F14 = REPO / 'msex' / 'f14'
KVIKDOS = Path('/home/xor/kvikdos/kvikdos')
MSC61 = REPO / 'msc61'


def run(cmd):
    return subprocess.run(cmd, cwd=str(REPO), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, encoding='latin1', errors='replace')


def unpack():
    pairs = [
        ('F14SRC.ZIP', 'src'),
        ('F14H.ZIP', 'h'),
        ('F14WAR.ZIP', 'war'),
        ('F14LARRY.ZIP', 'larry'),
    ]
    for z, d in pairs:
        zp = F14 / 'artifacts' / z
        if zp.exists():
            subprocess.run(['unzip', '-o', str(zp), '-d', str(F14 / d)], check=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)


def curate():
    removed = []
    if (F14 / 'larry').exists():
        shutil.rmtree(F14 / 'larry')
        removed.append('msex/f14/larry/*')

    rules = [
        (F14 / 'src', {'.c', '.asm', '.h', '.equ', '.inc', '.bat'}, {'makefile'}),
        (F14 / 'war', {'.c', '.h', '.bat'}, set()),
        (F14 / 'h', {'.h', '.me'}, set()),
    ]
    for folder, keep_exts, keep_names in rules:
        for p in list(folder.iterdir()):
            if not p.is_file():
                continue
            if p.name.lower() in keep_names:
                continue
            if p.suffix.lower() not in keep_exts:
                removed.append(str(p.relative_to(REPO)))
                p.unlink()
    # Known text payloads mislabeled as .C in this archive; keep as data, not code.
    for bad_c in ('START.C', 'CARRLAND.C', 'TEMP.C'):
        p = F14 / 'src' / bad_c
        if p.exists():
            p.rename(p.with_suffix('.TXT'))
            removed.append(str(p.relative_to(REPO)))
    return removed


def apply_easy_fixes():
    # Missing local headers from archive.
    (F14 / 'h' / 'MOUSE.H').write_text(
        '#ifndef F14_MOUSE_H\n#define F14_MOUSE_H\n'
        'extern int MouseXRel;\nextern int MouseYRel;\nextern int MouseBtns;\n'
        '#endif\n',
        encoding='latin1',
    )
    (F14 / 'h' / 'KEYS.H').write_text(
        '#ifndef F14_KEYS_H\n#define F14_KEYS_H\n'
        '#define AKEY 0x1e\n#define SKEY 0x1f\n#define FKEY 0x21\n#define CKEY 0x2e\n'
        '#define LEFTKEY 0x4b\n#define RIGHTKEY 0x4d\n#define UPKEY 0x48\n#define DOWNKEY 0x50\n'
        '#define SPACEBAR 0x39\n#define PLUSKEY 0x4e\n#define MINUSKEY 0x4a\n#endif\n',
        encoding='latin1',
    )
    (F14 / 'war' / 'READDEF.H').write_text(
        '#ifndef F14_READDEF_H\n#define F14_READDEF_H\n'
        '#include "readfile.h"\n#include "enums.h"\n'
        'extern _list _obWorlds[];\nextern _list _obWeathers[];\nextern _list _obLoadouts[];\n'
        'extern _list _obPathActions[];\nextern _list _obObjectNames[];\nextern _list _obTypes[];\n'
        'extern _list _obFormations[];\nextern _list _obSides[];\n'
        '#endif\n',
        encoding='latin1',
    )
    # Add include guards to non-UTF-safe READFILE.H by raw prepend/append.
    rf = F14 / 'war' / 'READFILE.H'
    b = rf.read_bytes()
    if b'F14_READFILE_H' not in b:
        rf.write_bytes(b'#ifndef F14_READFILE_H\n#define F14_READFILE_H\n\n' + b + b'\n#endif\n')

    def ensure_line(path: Path, needle: str, add_line: str):
        txt = path.read_text(encoding='latin1', errors='ignore')
        if needle not in txt:
            path.write_text(add_line + txt, encoding='latin1')

    # src fixes
    joy = F14 / 'src' / 'JOYREAD.C'
    if joy.exists():
        ensure_line(joy, '#include <stdio.h>', '#include <stdio.h>\n')
    start = F14 / 'src' / 'START.C'
    if start.exists():
        txt = start.read_text(encoding='latin1', errors='ignore')
        if '#include "setup.h"' not in txt and '#include "common.h"' in txt:
            txt = txt.replace('#include "common.h"', '#include "common.h"\n#include "setup.h"', 1)
            start.write_text(txt, encoding='latin1')
    hrm = F14 / 'src' / 'HRM.C'
    if hrm.exists():
        txt = hrm.read_text(encoding='latin1', errors='ignore')
        if 'Compatibility aliases seen in this source drop.' not in txt:
            txt = txt.replace(
                '#include "armt.h"\n',
                '#include "armt.h"\n\n'
                '/* Compatibility aliases seen in this source drop. */\n'
                '#ifndef D_RADAR\n#define D_RADAR D_AWG9\n#endif\n'
                '#ifndef APG_SNIFF\n#define APG_SNIFF AWG9_SNIFF\n#endif\n'
                '#ifndef DESIGNATED_AG\n#define DESIGNATED_AG DESIGNATED\n#endif\n',
                1,
            )
            hrm.write_text(txt, encoding='latin1')
    horz = F14 / 'src' / 'HORZ.C'
    if horz.exists():
        txt = horz.read_text(encoding='latin1', errors='ignore')
        if '#include "awg9.h"' not in txt:
            txt = txt.replace('#include "f15defs.h"', '#include "f15defs.h"\n#include "awg9.h"', 1)
        if 'extern TARGET   Targets[];' not in txt:
            txt = txt.replace(
                'extern  int     LightsOn;\n',
                'extern  int     LightsOn;\nextern TARGET   Targets[];\nextern TARGET   GTargets[];\n'
                '#ifndef MTNSEG\n#define MTNSEG 0\n#endif\n'
                '#ifndef F14L02\n#define F14L02 0\n#endif\n'
                '#ifndef F14COOLSEG\n#define F14COOLSEG 0\n#endif\n'
                '#ifndef GRNDSEG\n#define GRNDSEG 0\n#endif\n'
                '#ifndef MGRNDSEG\n#define MGRNDSEG 0\n#endif\n'
                '#ifndef LASTGRNDSEG\n#define LASTGRNDSEG 0\n#endif\n'
                '#ifndef AMERSEG\n#define AMERSEG 0\n#endif\n',
                1,
            )
        horz.write_text(txt, encoding='latin1')


def compile_sweep():
    results = []
    for sub in ('src', 'war'):
        for c in sorted((F14 / sub).glob('*.C')):
            base = c.stem.upper()
            cmd = [
                str(KVIKDOS),
                f'--mount=c:{c.parent}/',
                f'--mount=d:{MSC61}/',
                f'--mount=e:{F14 / "h"}/',
                '--env=PATH=D:\\BIN;D:\\',
                '--env=INCLUDE=D:\\INCLUDE;E:\\',
                '--env=LIB=D:\\LIB',
                '--drive=c',
                '--cwd-dos=C:\\',
                'D:\\BIN\\CL.EXE',
                '/c',
                '/nologo',
                f'/FoC:\\{base}.OBJ',
                f'C:\\{c.name}',
            ]
            r = run(cmd)
            ok = (r.returncode == 0 and (c.parent / f'{base}.OBJ').exists())
            results.append({
                'file': str(c.relative_to(REPO)),
                'ok': ok,
                'rc': r.returncode,
                'log_tail': r.stdout[-500:],
            })
    return results


def clean_build_products():
    for pat in ('*.OBJ', '*.EXE', '*.MAP', '*.LRF'):
        for p in F14.rglob(pat):
            if p.is_file():
                p.unlink()


def main():
    unpack()
    removed = curate()
    apply_easy_fixes()
    results = compile_sweep()
    ok = sum(1 for x in results if x['ok'])
    failed = [x for x in results if not x['ok']]
    summary = {
        'total': len(results),
        'ok': ok,
        'failed': len(failed),
        'failed_files': [x['file'] for x in failed],
        'removed_count': len(removed),
    }
    out = REPO / 'artifacts' / 'f14_build_report.json'
    out.write_text(json.dumps({'summary': summary, 'removed': removed, 'results': results}, indent=2), encoding='utf-8')
    clean_build_products()
    print(json.dumps(summary, indent=2))
    print(out)


if __name__ == '__main__':
    main()
