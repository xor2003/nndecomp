# nndecomp

Neural network 16bit C/C++ decompiler

Want to implement something like [https://github.com/facebookresearch/CodeGen](TransCoder)

## Current Dataset Pipeline

### 1) Build `.COD` from corpus with KvikDOS + DOS compilers
```bash
python3 scripts/build_corpus_cod_kvikdos.py \
  --dirs msex bcex tcex \
  --jobs 4 \
  --attempt-timeout 20 \
  --report artifacts/corpus_cod_build_report.json \
  --log artifacts/corpus_cod_build.log
```

### 2) Preprocess sources (one function per row)
```bash
python3 scripts/preprocess_dos_c_for_llm.py \
  --dirs msex bcex tcex \
  --report artifacts/corpus_cod_build_report.json \
  --out artifacts/dos_c_one_function.jsonl \
  --formatter none \
  --macro-expand none \
  --one-function-per-row \
  --make-compact-variant
```

### 3) Build strict decompilation QA dataset
```bash
python3 scripts/make_cod_function_qa.py \
  --preprocessed-jsonl artifacts/dos_c_one_function.jsonl \
  --out artifacts/cod_function_qa_strict_v2.jsonl \
  --answer-variant compact \
  --anonymize-symbols \
  --anonymize-asm \
  --require-cod \
  --only-label-match \
  --min-asm-lines 8 \
  --max-asm-lines 4000
```

### Strict dataset properties
- One function target per sample.
- Prompt contains only sanitized assembly (no source path leakage, no source-echo listing lines).
- Symbol names are anonymized (`fn1`, `id1`, `arg1`, `loc1`, `lbl1`).
- High-confidence subset (`label_match`) can be generated directly with `--only-label-match`.

TODO:

[x] Collect C++ sources of 16 bit code

[ ] Prepare build environment to convert .CPP into assembler. Prepare compilation validators

[ ] Adopt compilers input/output to analyze with LLM

[ ] Train LLM with compilers input/output

[ ] Profit

Thoughts:
1. Probably the NN should be trained on the sources processed by the preprocessor and indented.
2. And without system headers.
3. And somehow train on small fragments. For example one function or shorter.
4. Probably the source code in assembler is not suitable at all.
5 typedefs - must be replaced

build_prj.sh - will convert Borland C++ .prj file into makefile and build

doscompilelib.sh - library to execute various builders

sources.tar.bz2 - backup archive of source examples for Borland C++ 3/5, Turbo C++, Microsoft C++

/bcex/crc16eas/Source/ - first project to test on


