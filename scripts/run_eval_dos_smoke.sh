#!/usr/bin/env bash
set -euo pipefail

DATASET="${1:-artifacts/dataset/cod_combo_two_stage_small.jsonl}"
REPORT="${2:-artifacts/eval/dos_reexec_smoke.json}"

python3 scripts/validate_dataset_schema.py --in-jsonl "$DATASET"

python3 scripts/eval_dos_reexec.py \
  --dataset "$DATASET" \
  --max-samples 40 \
  --stage-filter readable \
  --with-edit-sim \
  --with-run \
  --report "$REPORT"

echo "Report: $REPORT"
