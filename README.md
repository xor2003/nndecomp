# nndecomp

`nndecomp` is a dataset and tooling project for training/evaluating decompilation LLMs on legacy **16-bit DOS C/C++** code.

The core idea is:
1. build old sources with real DOS compilers under emulation,
2. collect compiler-generated assembly/listings,
3. pair assembly with function-level C targets,
4. train/evaluate models on asm -> C recovery.

## What This Project Contains

- DOS source corpora (`msex`, `bcex`, `tcex`).
- DOS compiler toolchain directories (MSC variants, optional Borland/Turbo setups).
- Build and dataset scripts in `scripts/`.
- Dataset/evaluation artifacts under `artifacts/`.

## How It Works

### 1) Build phase
Scripts run DOS compilers through `kvikdos` and produce listing/assembly outputs (`.COD`/`.ASM` depending on flow).

### 2) Pairing phase
Function-level C is matched with function-level assembly slices.

### 3) Normalization phase
Assembly and C are sanitized/anonymized to reduce leakage and improve training consistency.

### 4) Dataset phase
JSONL chat-format rows are produced for SFT:
- single-stage: asm -> final C
- two-stage: asm -> skeleton, then asm+skeleton -> readable C

### 5) Evaluation phase
Generated outputs are scored with DOS toolchain re-compilation checks (and optional run checks/edit similarity).

## Main Scripts

- `scripts/build_corpus_cod_kvikdos.py`: build corpus with DOS compilers.
- `scripts/preprocess_dos_c_for_llm.py`: source preprocessing and function extraction.
- `scripts/make_cod_function_qa.py`: strict asm/C QA construction.
- `scripts/build_combo_dataset.py`: compiler-flag combo dataset generation (single/two-stage).
- `scripts/eval_dos_reexec.py`: compile/run/edit-sim evaluator.
- `scripts/validate_dataset_schema.py`: JSONL schema checks for training rows.
- `scripts/make_dataset_manifest.py`: dataset hash/stat manifest generator.
- `scripts/run_final_combo_dataset.sh`: convenience wrapper for full combo generation.
- `scripts/run_eval_dos_smoke.sh`: small evaluator smoke wrapper.
- `scripts/run_dataset_smoke_pipeline.sh`: split+validate+benchmark+eval smoke pipeline.

## Typical Usage

### Build corpus outputs
```bash
python3 scripts/build_corpus_cod_kvikdos.py \
  --dirs msex bcex tcex \
  --jobs 4 \
  --attempt-timeout 20 \
  --report artifacts/corpus_cod_build_report.json \
  --log artifacts/corpus_cod_build.log
```

### Build combo training dataset
```bash
python3 scripts/build_combo_dataset.py \
  --reports artifacts/msex_cod_build_report.json artifacts/retest_chunk2_report.json \
  --compiler msc61 \
  --out artifacts/dataset/cod_combo.jsonl \
  --index artifacts/dataset/cod_combo.index.jsonl \
  --dataset-mode two-stage \
  --prompt-tags \
  --max-kept-variants-per-source 24
```

### Evaluate dataset outputs (smoke)
```bash
scripts/run_eval_dos_smoke.sh \
  artifacts/dataset/cod_combo_two_stage_small.jsonl \
  artifacts/eval/dos_reexec_smoke.json
```

### Evaluate directly
```bash
python3 scripts/eval_dos_reexec.py \
  --dataset artifacts/dataset/cod_combo_two_stage_small.jsonl \
  --stage-filter readable \
  --with-edit-sim \
  --with-run \
  --report artifacts/eval/dos_reexec.json
```

### Smoke dataset pipeline
```bash
scripts/run_dataset_smoke_pipeline.sh \
  artifacts/dataset/cod_combo_parallel_small.jsonl \
  artifacts/dataset/smoke \
  artifacts/eval/dos_reexec_smoke_pipeline.json
```

### Write dataset manifest
```bash
python3 scripts/make_dataset_manifest.py \
  --in-jsonl artifacts/dataset/cod_combo_parallel_small.jsonl \
  --out-json artifacts/dataset/cod_combo_parallel_small.manifest.json
```

## Dataset Format (Current)

Rows are JSON objects with `messages` (chat format) and optional `meta`.

`meta` can include:
- `function`
- `flags`
- `compiler`
- `source`
- `raw_hash`, `norm_hash`
- `stage` (`skeleton` / `readable`) for two-stage mode

## Dataset Link

- Current small parallel sample dataset:
  - https://github.com/xor2003/nndecomp/blob/master/artifacts/dataset/cod_combo_parallel_small.jsonl

## Current Features

- DOS compiler build automation via `kvikdos`.
- Multi-flag variant generation with dedup by raw/normalized assembly hashes.
- Function-level asm extraction and strict filtering (`label_match`, line bounds).
- Symbol anonymization for both C and asm.
- Two-stage dataset generation (`single` / `two-stage`).
- Prompt tagging by compiler/opt/domain.
- Re-exec evaluator with:
  - compile-rate,
  - optional run-rate,
  - pass@k estimates for multi-candidate outputs,
  - bootstrap confidence intervals,
  - stratified metrics,
  - optional edit similarity.

## Notes

- This project intentionally targets old DOS toolchains and source conventions.
- Keep original source encoding/line style where possible; avoid destructive rewrites to legacy code.
- Use smoke runs first, then scale up.
