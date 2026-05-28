#!/usr/bin/env python3
import argparse
import json
import math
import random
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


def choose_candidates(row: dict, candidates_field: str) -> list[str]:
    base = choose_prediction(row)
    cands = []
    if base.strip():
        cands.append(base)
    if candidates_field:
        v = row.get(candidates_field)
        if isinstance(v, list):
            for x in v:
                if isinstance(x, str) and x.strip():
                    cands.append(x)
    # stable de-dup preserving order
    out = []
    seen = set()
    for c in cands:
        if c in seen:
            continue
        seen.add(c)
        out.append(c)
    return out


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


def pass_at_k(n: int, c: int, k: int) -> float:
    # HumanEval-style unbiased estimator.
    if k <= 0 or n <= 0:
        return 0.0
    k = min(k, n)
    if n - c < k:
        return 1.0
    prod = 1.0
    for i in range(n - c + 1, n + 1):
        prod *= (1.0 - (k / i))
    return 1.0 - prod


def bootstrap_ci(values: list[int], iters: int = 1000, alpha: float = 0.05, seed: int = 1337) -> tuple[float | None, float | None]:
    if not values:
        return None, None
    rng = random.Random(seed)
    n = len(values)
    means = []
    for _ in range(iters):
        sample = [values[rng.randrange(n)] for _ in range(n)]
        means.append(sum(sample) / n)
    means.sort()
    lo_i = int(math.floor((alpha / 2.0) * (iters - 1)))
    hi_i = int(math.ceil((1.0 - alpha / 2.0) * (iters - 1)))
    return means[lo_i], means[hi_i]


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
    ap.add_argument('--candidates-field', default='', help='Optional list[str] field with alternative predictions.')
    ap.add_argument('--max-candidates', type=int, default=0, help='If >0, evaluate at most this many candidates per row.')
    ap.add_argument('--pass-k', default='1,3,5', help='Comma-separated k values for pass@k estimate.')
    ap.add_argument('--bootstrap-iters', type=int, default=1000, help='Bootstrap iterations for confidence intervals.')
    ap.add_argument('--bootstrap-alpha', type=float, default=0.05, help='Alpha for confidence intervals.')
    ap.add_argument('--report', default='artifacts/eval/dos_reexec_report.json')
    ap.add_argument('--out-samples', default='', help='Optional JSONL path for per-sample eval outcomes.')
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
    sample_rows = []
    compile_binary = []
    run_binary = []
    cand_stats = {'rows': 0, 'total_candidates': 0, 'compile_success_candidates': 0, 'run_success_candidates': 0}
    passk_compile_acc = {}
    passk_run_acc = {}
    pass_ks = []
    for x in str(args.pass_k).split(','):
        x = x.strip()
        if x.isdigit() and int(x) > 0:
            pass_ks.append(int(x))
    if not pass_ks:
        pass_ks = [1, 3, 5]

    for i, row in enumerate(rows):
        meta = row.get('meta') or {}
        stage = str(meta.get('stage', ''))
        if args.stage_filter == 'readable' and stage and stage != 'readable':
            continue
        if args.stage_filter == 'skeleton' and stage and stage != 'skeleton':
            continue
        preds = choose_candidates(row, args.candidates_field)
        if args.max_candidates > 0:
            preds = preds[:args.max_candidates]
        if not preds:
            continue
        cand_stats['rows'] += 1
        cand_stats['total_candidates'] += len(preds)
        comp = args.compiler or meta.get('compiler', 'msc61')
        if comp not in TOOLCHAINS:
            comp = 'msc61'
        flags = meta.get('flags') or args.default_flags

        preds = [canonicalize_pred_func_name(p, str(meta.get('function', '') or '')) for p in preds]
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
        code_variants_all = []
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
            pass

        ok = False
        ok_run = False
        diag = ''
        best_pred = ''
        cand_compile_hits = 0
        cand_run_hits = 0
        src_dir = None
        if isinstance(src_rel, str) and src_rel:
            sp = REPO_ROOT / src_rel
            if sp.exists():
                src_dir = sp.parent
        for pred in preds:
            code_variants = []
            if args.with_run and test_code.strip():
                inc_pred, body_pred = split_includes_and_body(pred)
                code_run = '\n'.join([x for x in (src_includes, dep, inc_pred, body_pred, test_code) if x.strip()])
                code_variants.append((code_run, True))
            code_compile = '\n'.join([x for x in (src_includes, pred) if x.strip()])
            code_variants.append((code_compile, False))
            if not code_compile.strip():
                code_variants.append((pred, False))
            local_ok = False
            local_run = False
            local_diag = ''
            for code, want_run in code_variants:
                local_ok, local_run, local_diag = compile_and_maybe_run(code, comp, flags, args.timeout, want_run, src_dir=src_dir)
                if local_ok:
                    cand_compile_hits += 1
                    if local_run:
                        cand_run_hits += 1
                    break
            if local_ok and not ok:
                ok, ok_run, diag = local_ok, local_run, local_diag
                best_pred = pred
            elif (not ok) and local_diag:
                diag = local_diag
            if ok and (ok_run or not args.with_run):
                break
        if not best_pred and preds:
            best_pred = preds[0]

        total += 1
        if ok:
            compile_ok += 1
            compile_binary.append(1)
        else:
            compile_binary.append(0)
        if ok_run:
            run_ok += 1
            run_binary.append(1)
        elif args.with_run and test_code.strip():
            run_binary.append(0)
        cand_stats['compile_success_candidates'] += cand_compile_hits
        cand_stats['run_success_candidates'] += cand_run_hits
        n = len(preds)
        c_comp = min(cand_compile_hits, n)
        c_run = min(cand_run_hits, n)
        for k in pass_ks:
            passk_compile_acc.setdefault(str(k), []).append(pass_at_k(n, c_comp, k))
            if args.with_run and test_code.strip():
                passk_run_acc.setdefault(str(k), []).append(pass_at_k(n, c_run, k))

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
                es = edit_similarity(gt, best_pred)
                edit_scores.append(es)
            else:
                es = None
        else:
            es = None

        if not ok and len(failures) < 20:
            failures.append({'index': i, 'source': meta.get('source', ''), 'compiler': comp, 'flags': flags, 'diag': diag[-500:]})
        sample_rows.append({
            'index': i,
            'source': meta.get('source', ''),
            'function': meta.get('function', ''),
            'stage': stage,
            'compiler': comp,
            'flags': flags,
            'candidates': len(preds),
            'compile_ok': bool(ok),
            'run_ok': bool(ok_run),
            'candidate_compile_hits': cand_compile_hits,
            'candidate_run_hits': cand_run_hits,
            'edit_similarity': es,
            'diag_tail': (diag[-500:] if isinstance(diag, str) else ''),
        })

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
        'confidence_intervals': {
            'compile_rate': {
                'alpha': args.bootstrap_alpha,
                'iters': args.bootstrap_iters,
                'low': bootstrap_ci(compile_binary, args.bootstrap_iters, args.bootstrap_alpha)[0],
                'high': bootstrap_ci(compile_binary, args.bootstrap_iters, args.bootstrap_alpha)[1],
            },
            'run_rate': {
                'alpha': args.bootstrap_alpha,
                'iters': args.bootstrap_iters,
                'low': bootstrap_ci(run_binary, args.bootstrap_iters, args.bootstrap_alpha)[0],
                'high': bootstrap_ci(run_binary, args.bootstrap_iters, args.bootstrap_alpha)[1],
            },
        },
        'candidate_stats': {
            **cand_stats,
            'avg_candidates_per_row': (cand_stats['total_candidates'] / cand_stats['rows']) if cand_stats['rows'] else 0.0,
            'candidate_compile_rate': (cand_stats['compile_success_candidates'] / cand_stats['total_candidates']) if cand_stats['total_candidates'] else 0.0,
            'candidate_run_rate': (cand_stats['run_success_candidates'] / cand_stats['total_candidates']) if cand_stats['total_candidates'] else 0.0,
        },
        'pass_at_k': {
            'compile': {k: (statistics.fmean(v) if v else 0.0) for k, v in sorted(passk_compile_acc.items(), key=lambda x: int(x[0]))},
            'run': {k: (statistics.fmean(v) if v else 0.0) for k, v in sorted(passk_run_acc.items(), key=lambda x: int(x[0]))},
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
    if args.out_samples:
        op = Path(args.out_samples)
        op.parent.mkdir(parents=True, exist_ok=True)
        with op.open('w', encoding='utf-8') as w:
            for r in sample_rows:
                w.write(json.dumps(r, ensure_ascii=False) + '\n')
    print(json.dumps({
        'samples_evaluated': report['samples_evaluated'],
        'compile_rate': report['compile_rate'],
        'run_rate': report['run']['run_rate'],
        'pass_at_1_compile': report['pass_at_k']['compile'].get('1'),
        'edit_mean': report['edit_similarity']['mean'],
        'report': args.report,
    }))


if __name__ == '__main__':
    main()
