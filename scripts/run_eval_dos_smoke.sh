#!/usr/bin/env bash
set -euo pipefail

DATASET="${1:-artifacts/dataset/cod_combo_two_stage_small.jsonl}"
REPORT="${2:-artifacts/eval/dos_reexec_smoke.json}"
SAMPLES="${3:-artifacts/eval/dos_reexec_smoke.samples.jsonl}"
AGG_REPORT="${4:-artifacts/eval/dos_reexec_smoke.aggregate.json}"
REPEATS="${REPEATS:-2}"

python3 scripts/validate_dataset_schema.py --in-jsonl "$DATASET"

REPORTS=()
for i in $(seq 1 "$REPEATS"); do
  R="${REPORT%.json}.r${i}.json"
  S="${SAMPLES%.jsonl}.r${i}.jsonl"
  python3 scripts/eval_dos_reexec.py \
    --dataset "$DATASET" \
    --max-samples 40 \
    --stage-filter readable \
    --with-edit-sim \
    --with-run \
    --out-samples "$S" \
    --report "$R"
  REPORTS+=("$R")
done

python3 scripts/aggregate_eval_reports.py --reports "${REPORTS[@]}" --out "$AGG_REPORT"

echo "Reports: ${REPORTS[*]}"
echo "Aggregate: $AGG_REPORT"
