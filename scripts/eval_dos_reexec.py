#!/usr/bin/env python3
import argparse
import json
import re
import statistics
import subprocess
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
KVIKDOS = Path('/home/xor/kvikdos/kvikdos')

TOOLCHAINS = {
    'msc61': {'root': REPO_ROOT / 'msc61', 'exe': 'CL.EXE'},
    'msc6': {'root': REPO_ROOT / 'msc60', 'exe': 'CL.EXE'},
    'msc5': {'root': REPO_ROOT / 'msc5', 'exe': 'CL.EXE'},
    'msc4': {'root': REPO_ROOT / 'msc4', 'exe': 'CL.EXE'},
}


def find_exe(tc_root: Path, exe_name: str) -> str | None:
    for c in (tc_root / 'BIN' / exe_name, tc_root / 'bin' / exe_name, tc_root / exe_name):
        if c.exists():
            return 'D:\\' + str(c.relative_to(tc_root)).replace('/', '\\\\')
    return None


def normalize_text_for_edit(s: str) -> str:
    s = re.sub(r'/\*.*?\*/', '', s, flags=re.S)
    s = re.sub(r'//.*?$', '', s, flags=re.M)
    s = '\n'.join(x.strip() for x in s.splitlines() if x.strip())
    return s


def edit_similarity(a: str, b: str) -> float:
    a = normalize_text_for_edit(a)
    b = normalize_text_for_edit(b)
    if not a and not b:
        return 1.0
    la, lb = len(a), len(b)
    if la == 0 or lb == 0:
        return 0.0
    dp = list(range(lb + 1))
    for i in range(1, la + 1):
        prev = dp[0]
        dp[0] = i
        ca = a[i - 1]
        for j in range(1, lb + 1):
            tmp = dp[j]
            cost = 0 if ca == b[j - 1] else 1
            dp[j] = min(dp[j] + 1, dp[j - 1] + 1, prev + cost)
            prev = tmp
    dist = dp[lb]
    return 1.0 - dist / max(la, lb)


def load_jsonl(path: Path):
    rows = []
    with path.open(encoding='utf-8') as f:
        for ln in f:
            ln = ln.strip()
            if not ln:
                continue
            rows.append(json.loads(ln))
    return rows


def choose_prediction(row: dict) -> str:
    if 'prediction' in row and isinstance(row['prediction'], str):
        return row['prediction']
    msgs = row.get('messages') or []
    if msgs and isinstance(msgs, list):
        for m in reversed(msgs):
            if m.get('role') == 'assistant' and isinstance(m.get('content'), str):
                return m['content']
    return ''


def canonicalize_pred_func_name(pred: str, expected_name: str) -> str:
    if not pred.strip() or not expected_name:
        return pred
    m = re.search(r'\b([A-Za-z_][A-Za-z0-9_]*)\s*\(', pred)
    if not m:
        return pred
    old = m.group(1)
    if old == expected_name:
        return pred
    return re.sub(rf'\b{re.escape(old)}\b', expected_name, pred)


def split_includes_and_body(text: str) -> tuple[str, str]:
    inc = []
    body = []
    for ln in text.splitlines():
        if ln.lstrip().startswith('#include'):
            inc.append(ln)
        else:
            body.append(ln)
    return '\n'.join(inc), '\n'.join(body)


def compile_and_maybe_run(code: str, compiler: str, flags: str, timeout: int, run_exe: bool, src_dir: Path | None = None) -> tuple[bool, bool, str]:
    tc = TOOLCHAINS[compiler]
    exe_dos = find_exe(tc['root'], tc['exe'])
    if not exe_dos:
        return False, False, 'compiler_not_found'
    with tempfile.TemporaryDirectory(prefix='dos_eval_') as td:
        tdp = Path(td)
        if src_dir and src_dir.exists():
            tbase = f"EV{next(tempfile._get_candidate_names())[:6].upper()}"
            twork = src_dir
        else:
            tbase = "FUNC"
            twork = tdp
        src = twork / f'{tbase}.C'
        asm = twork / f'{tbase}.ASM'
        obj = twork / f'{tbase}.OBJ'
        exe = twork / f'{tbase}.EXE'
        src.write_text(code, encoding='latin1', errors='replace')
        cmd_compile = [
            str(KVIKDOS), f'--mount=c:{twork}/', f'--mount=d:{tc["root"]}/', '--drive=c', '--cwd-dos=C:\\',
            '--env=PATH=D:\\BIN;D:\\', '--env=INCLUDE=D:\\INCLUDE', '--env=LIB=D:\\LIB',
            exe_dos, '/AS', *([x for x in flags.split() if x]), f'/FaC:\\{tbase}.ASM', f'/FoC:\\{tbase}.OBJ', f'/FeC:\\{tbase}.EXE', f'C:\\{tbase}.C'
        ]
        try:
            r = subprocess.run(cmd_compile, cwd=str(REPO_ROOT), stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                               text=True, encoding='latin1', errors='replace', timeout=timeout)
        except subprocess.TimeoutExpired:
            return False, False, 'timeout_compile'
        ok_compile = (asm.exists() or obj.exists() or exe.exists()) and (r.returncode == 0)
        if not ok_compile:
            return False, False, r.stdout[-2000:]
        if not run_exe:
            for p in (src, asm, obj, exe):
                try:
                    p.unlink()
                except OSError:
                    pass
            return True, False, r.stdout[-2000:]
        cmd_run = [
            str(KVIKDOS), f'--mount=c:{twork}/', f'--mount=d:{tc["root"]}/', '--drive=c', '--cwd-dos=C:\\',
            '--env=PATH=D:\\BIN;D:\\', '--env=INCLUDE=D:\\INCLUDE', '--env=LIB=D:\\LIB',
            f'C:\\{tbase}.EXE'
        ]
        try:
            rr = subprocess.run(cmd_run, cwd=str(REPO_ROOT), stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                text=True, encoding='latin1', errors='replace', timeout=timeout)
        except subprocess.TimeoutExpired:
            return True, False, 'timeout_run'
        ok_run = rr.returncode == 0
        for p in (src, asm, obj, exe):
            try:
                p.unlink()
            except OSError:
                pass
        return True, ok_run, (r.stdout + '\n' + rr.stdout)[-3000:]


def main():
    ap = argparse.ArgumentParser(description='Evaluate DOS decompilation outputs by compile-rate (and optional edit-sim).')
    ap.add_argument('--dataset', required=True, help='JSONL with messages+meta and optional prediction field.')
    ap.add_argument('--compiler', default='', choices=['', 'msc61', 'msc6', 'msc5', 'msc4'])
    ap.add_argument('--default-flags', default='/Od')
    ap.add_argument('--timeout', type=int, default=20)
    ap.add_argument('--max-samples', type=int, default=0)
    ap.add_argument('--with-edit-sim', action='store_true')
    ap.add_argument('--with-run', action='store_true', help='Also compute run_rate for rows containing test/main code.')
    ap.add_argument('--stage-filter', choices=['all', 'readable', 'skeleton'], default='readable')
    ap.add_argument('--report', default='artifacts/eval/dos_reexec_report.json')
    args = ap.parse_args()

    rows = load_jsonl(Path(args.dataset))
    if args.max_samples > 0:
        rows = rows[:args.max_samples]

    Path(args.report).parent.mkdir(parents=True, exist_ok=True)

    total = 0
    compile_ok = 0
    run_eligible = 0
    run_ok = 0
    strat = {}
    edit_scores = []
    failures = []

    for i, row in enumerate(rows):
        meta = row.get('meta') or {}
        stage = str(meta.get('stage', ''))
        if args.stage_filter == 'readable' and stage and stage != 'readable':
            continue
        if args.stage_filter == 'skeleton' and stage and stage != 'skeleton':
            continue
        pred = choose_prediction(row)
        if not pred.strip():
            continue
        comp = args.compiler or meta.get('compiler', 'msc61')
        if comp not in TOOLCHAINS:
            comp = 'msc61'
        flags = meta.get('flags') or args.default_flags

        pred = canonicalize_pred_func_name(pred, str(meta.get('function', '') or ''))
        dep = ''
        test_code = ''
        for k in ('func_dep', 'dep', 'includes', 'headers'):
            if isinstance(row.get(k), str) and row.get(k).strip():
                dep = row[k]
                break
        for k in ('c_test', 'test', 'unit_test', 'main_test'):
            if isinstance(row.get(k), str) and row.get(k).strip():
                test_code = row[k]
                break
        # Try with includes from original source if available; fallback to plain prediction.
        code_variants = []
        src_rel = meta.get('source')
        src_includes = ''
        if isinstance(src_rel, str) and src_rel:
            src_path = REPO_ROOT / src_rel
            if src_path.exists():
                src_text = src_path.read_text('latin1', errors='replace')
                src_includes = '\n'.join([ln for ln in src_text.splitlines() if ln.lstrip().startswith('#include')])
        if args.with_run and test_code.strip():
            run_eligible += 1
            inc_pred, body_pred = split_includes_and_body(pred)
            code_run = '\n'.join([x for x in (src_includes, dep, inc_pred, body_pred, test_code) if x.strip()])
            code_variants.append((code_run, True))
        code_compile = '\n'.join([x for x in (src_includes, pred) if x.strip()])
        code_variants.append((code_compile, False))
        if not code_compile.strip():
            code_variants.append((pred, False))

        ok = False
        ok_run = False
        diag = ''
        src_dir = None
        if isinstance(src_rel, str) and src_rel:
            sp = REPO_ROOT / src_rel
            if sp.exists():
                src_dir = sp.parent
        for code, want_run in code_variants:
            ok, ok_run, diag = compile_and_maybe_run(code, comp, flags, args.timeout, want_run, src_dir=src_dir)
            if ok:
                break

        total += 1
        if ok:
            compile_ok += 1
        if ok_run:
            run_ok += 1

        key_opt = 'OPTUNK'
        m = re.search(r'/O([A-Za-z]+)', flags)
        if m:
            key_opt = ('O' + m.group(1)).upper()
        skey = f'{comp}:{key_opt}'
        s = strat.setdefault(skey, {'total': 0, 'compile_ok': 0, 'run_eligible': 0, 'run_ok': 0})
        s['total'] += 1
        if ok:
            s['compile_ok'] += 1
        if args.with_run and test_code.strip():
            s['run_eligible'] += 1
        if ok_run:
            s['run_ok'] += 1

        if args.with_edit_sim:
            msgs = row.get('messages') or []
            gt = ''
            for m2 in reversed(msgs):
                if m2.get('role') == 'assistant' and isinstance(m2.get('content'), str):
                    gt = m2['content']
                    break
            if gt:
                edit_scores.append(edit_similarity(gt, pred))

        if not ok and len(failures) < 20:
            failures.append({'index': i, 'source': meta.get('source', ''), 'compiler': comp, 'flags': flags, 'diag': diag[-500:]})

    report = {
        'dataset': args.dataset,
        'samples_evaluated': total,
        'compile_ok': compile_ok,
        'compile_rate': (compile_ok / total) if total else 0.0,
        'run': {
            'enabled': bool(args.with_run),
            'eligible': run_eligible,
            'ok': run_ok,
            'run_rate': (run_ok / run_eligible) if run_eligible else None,
        },
        'stratified': {
            k: {
                'total': v['total'],
                'compile_ok': v['compile_ok'],
                'compile_rate': (v['compile_ok'] / v['total']) if v['total'] else 0.0,
                'run_eligible': v['run_eligible'],
                'run_ok': v['run_ok'],
                'run_rate': (v['run_ok'] / v['run_eligible']) if v['run_eligible'] else None,
            } for k, v in sorted(strat.items())
        },
        'edit_similarity': {
            'enabled': bool(args.with_edit_sim),
            'count': len(edit_scores),
            'mean': statistics.fmean(edit_scores) if edit_scores else None,
            'median': statistics.median(edit_scores) if edit_scores else None,
        },
        'failures_sample': failures,
    }

    Path(args.report).write_text(json.dumps(report, indent=2), encoding='utf-8')
    print(json.dumps({
        'samples_evaluated': report['samples_evaluated'],
        'compile_rate': report['compile_rate'],
        'run_rate': report['run']['run_rate'],
        'edit_mean': report['edit_similarity']['mean'],
        'report': args.report,
    }))


if __name__ == '__main__':
    main()
