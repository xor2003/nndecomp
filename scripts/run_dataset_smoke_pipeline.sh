#!/usr/bin/env bash
set -euo pipefail

IN_JSONL="${1:-artifacts/dataset/cod_combo_parallel_small.jsonl}"
OUT_DIR="${2:-artifacts/dataset/smoke}"
EVAL_REPORT="${3:-artifacts/eval/dos_reexec_smoke_pipeline.json}"
EVAL_SAMPLES="${4:-artifacts/eval/dos_reexec_smoke_pipeline.samples.jsonl}"

mkdir -p "$OUT_DIR" "$(dirname "$EVAL_REPORT")"

TRAIN="$OUT_DIR/train.jsonl"
VAL="$OUT_DIR/val.jsonl"
TEST="$OUT_DIR/test.jsonl"
BENCH="$OUT_DIR/benchmark_readable.jsonl"
BENCH_INDEX="$OUT_DIR/benchmark_readable.index.json"
MANIFEST="$OUT_DIR/manifest.json"

rtk python3 scripts/validate_dataset_schema.py --in-jsonl "$IN_JSONL"

rtk python3 scripts/split_dataset_leak_safe.py \
  --in-jsonl "$IN_JSONL" \
  --out-train "$TRAIN" \
  --out-val "$VAL" \
  --out-test "$TEST" \
  --train-ratio 0.9 \
  --val-ratio 0.05 \
  --seed 1337 \
  --stage-filter all

rtk python3 scripts/make_benchmark_pack.py \
  --in-jsonl "$TEST" \
  --out-jsonl "$BENCH" \
  --out-index "$BENCH_INDEX" \
  --mode opt-balanced \
  --dedup-by norm_hash \
  --stage-filter readable \
  --quality high \
  --per-opt 20 \
  --seed 1337

rtk python3 scripts/validate_dataset_schema.py --in-jsonl "$TRAIN"
rtk python3 scripts/validate_dataset_schema.py --in-jsonl "$VAL"
rtk python3 scripts/validate_dataset_schema.py --in-jsonl "$TEST"
rtk python3 scripts/validate_dataset_schema.py --in-jsonl "$BENCH"

rtk python3 scripts/make_dataset_manifest.py --in-jsonl "$IN_JSONL" --out-json "$MANIFEST"

rtk python3 scripts/eval_dos_reexec.py \
  --dataset "$BENCH" \
  --stage-filter readable \
  --max-samples 64 \
  --max-candidates 1 \
  --out-samples "$EVAL_SAMPLES" \
  --report "$EVAL_REPORT"

echo "Smoke pipeline done"
echo "Input:      $IN_JSONL"
echo "Train/Val/Test: $TRAIN | $VAL | $TEST"
echo "Benchmark:  $BENCH"
echo "Manifest:   $MANIFEST"
echo "Eval:       $EVAL_REPORT"
echo "Eval rows:  $EVAL_SAMPLES"
