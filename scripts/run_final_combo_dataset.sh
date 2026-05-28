#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   scripts/run_final_combo_dataset.sh [compiler]
# Default compiler: msc61

COMPILER="${1:-msc61}"

python3 scripts/build_combo_dataset.py \
  --reports \
    artifacts/msex_cod_build_report.json \
    artifacts/retest_chunk2_report.json \
    artifacts/corpus_cod_build_report_full_v4.json \
  --compiler "$COMPILER" \
  --out artifacts/dataset/cod_combo_strict_all_messages.jsonl \
  --index artifacts/dataset/cod_combo_index.jsonl \
  --timeout 20 \
  --resume \
  --max-kept-variants-per-source 24

OUT_JSONL="artifacts/dataset/cod_combo_strict_all_messages.jsonl"
MANIFEST_JSON="artifacts/dataset/cod_combo_strict_all_messages.manifest.json"

python3 scripts/validate_dataset_schema.py --in-jsonl "$OUT_JSONL"
python3 scripts/make_dataset_manifest.py --in-jsonl "$OUT_JSONL" --out-json "$MANIFEST_JSON"

echo "Dataset:  $OUT_JSONL"
echo "Manifest: $MANIFEST_JSON"
