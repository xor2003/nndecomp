#!/usr/bin/env python3
import argparse
import json
from pathlib import Path


def clean_text(s: str) -> str:
    return s.replace("\r\n", "\n").replace("\r", "\n")


def main():
    parser = argparse.ArgumentParser(description="Convert .COD + .C pairs into JSONL training data")
    parser.add_argument("--root", default="msex", help="Root directory to scan")
    parser.add_argument("--out", default="artifacts/msex_cod_training.jsonl")
    parser.add_argument("--min-cod-bytes", type=int, default=64)
    args = parser.parse_args()

    root = Path(args.root).resolve()
    out = Path(args.out).resolve()
    out.parent.mkdir(parents=True, exist_ok=True)

    c_files = sorted(root.rglob("*.C"))
    count = 0

    with out.open("w", encoding="utf-8") as outf:
        for c_file in c_files:
            cod_file = c_file.with_suffix(".COD")
            if not cod_file.exists():
                continue
            if cod_file.stat().st_size < args.min_cod_bytes:
                continue

            source = clean_text(c_file.read_text(errors="replace"))
            cod = clean_text(cod_file.read_text(errors="replace"))
            rel = c_file.relative_to(root).as_posix()

            example = {
                "id": rel,
                "messages": [
                    {"role": "system", "content": "You are a decompiler assistant that converts 16-bit x86 compiler listings to C."},
                    {"role": "user", "content": f"Recover C source for this Microsoft C listing:\n\n{cod}"},
                    {"role": "assistant", "content": source},
                ],
                "meta": {
                    "source_path": rel,
                    "cod_path": c_file.with_suffix(".COD").relative_to(root).as_posix(),
                },
            }
            outf.write(json.dumps(example, ensure_ascii=True) + "\n")
            count += 1

    print(f"Wrote {count} training examples to {out}")


if __name__ == "__main__":
    main()
