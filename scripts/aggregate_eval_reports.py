#!/usr/bin/env python3
import argparse
import json
import statistics
from pathlib import Path


def mean_std(vals):
    if not vals:
        return {'mean': None, 'std': None, 'n': 0}
    if len(vals) == 1:
        return {'mean': vals[0], 'std': 0.0, 'n': 1}
    return {'mean': statistics.fmean(vals), 'std': statistics.pstdev(vals), 'n': len(vals)}


def main():
    ap = argparse.ArgumentParser(description='Aggregate multiple eval_dos_reexec JSON reports (repeat runs).')
    ap.add_argument('--reports', nargs='+', required=True)
    ap.add_argument('--out', required=True)
    args = ap.parse_args()

    reps = []
    for rp in args.reports:
        p = Path(rp)
        if p.exists():
            reps.append(json.loads(p.read_text(encoding='utf-8')))
    if not reps:
        raise SystemExit('no reports loaded')

    compile_rates = [float(r.get('compile_rate') or 0.0) for r in reps]
    run_rates = [r.get('run', {}).get('run_rate') for r in reps]
    run_rates = [float(x) for x in run_rates if x is not None]
    p1 = [float((r.get('pass_at_k') or {}).get('compile', {}).get('1') or 0.0) for r in reps]

    by_reason = {}
    for r in reps:
        rr = r.get('failure_reasons') or {}
        for k, v in rr.items():
            by_reason.setdefault(k, 0)
            by_reason[k] += int(v)

    out = {
        'reports': args.reports,
        'count': len(reps),
        'compile_rate': mean_std(compile_rates),
        'run_rate': mean_std(run_rates),
        'pass_at_1_compile': mean_std(p1),
        'failure_reasons_total': dict(sorted(by_reason.items())),
    }

    op = Path(args.out)
    op.parent.mkdir(parents=True, exist_ok=True)
    op.write_text(json.dumps(out, indent=2), encoding='utf-8')
    print(json.dumps({'count': len(reps), 'out': str(op)}))


if __name__ == '__main__':
    main()
