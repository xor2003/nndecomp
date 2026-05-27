#!/usr/bin/env python3
import argparse
import csv
import json
import subprocess
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
MSEX_ROOT = REPO_ROOT / "msex"
KVIKDOS = Path("/home/xor/kvikdos/kvikdos")

COMPILER_DIRS = {
    "msc61": REPO_ROOT / "msc61",
    "msc6": REPO_ROOT / "msc60",
    "msc5": REPO_ROOT / "msc5",
    "msc4": REPO_ROOT / "msc4",
    "tcpp1": Path("/home/xor/inertia_player/dos_compilers/Borland Turbo C++ v1"),
}

DEFAULT_ORDER = ["msc61", "msc6", "msc5", "msc4", "tcpp1"]


def load_overrides(path: Path):
    overrides = {}
    if not path.exists():
        return overrides
    with path.open("r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            if not row:
                continue
            rel_raw = row.get("path")
            compilers_raw = row.get("compilers")
            if rel_raw is None or compilers_raw is None:
                continue
            rel = rel_raw.strip().replace("\\", "/")
            compilers = compilers_raw.strip()
            flags = (row.get("flags") or "").strip()
            if rel.startswith("#"):
                continue
            if not rel or not compilers:
                continue
            order = [c.strip().lower() for c in compilers.split(",") if c.strip()]
            if order:
                overrides[rel] = {"compilers": order, "flags": flags}
    return overrides


def installed_compilers():
    out = {}
    for name, path in COMPILER_DIRS.items():
        if name.startswith("msc"):
            if (path / "BIN" / "CL.EXE").exists() or (path / "bin" / "CL.EXE").exists() or (path / "bin" / "cl.exe").exists():
                out[name] = path
        elif name == "tcpp1":
            if (path / "BIN" / "TCC.EXE").exists() or (path / "bin" / "TCC.EXE").exists():
                out[name] = path
    return out


def to_dos(rel_path: Path):
    return "C:\\" + str(rel_path).replace("/", "\\")


def compile_one(c_file: Path, compiler_name: str, compiler_dir: Path, msex_root: Path, extra_flags: str):
    rel = c_file.relative_to(msex_root)
    cod_rel = rel.with_suffix(".COD")
    src_name = c_file.name
    cod_name = c_file.with_suffix(".COD").name
    src_dir = c_file.parent
    if compiler_name == "tcpp1":
        asm_name = c_file.with_suffix(".ASM").name
        cmd = [
            str(KVIKDOS),
            f"--mount=c:{src_dir}/",
            f"--mount=d:{compiler_dir}/",
            "--env=PATH=D:\\BIN",
            "--env=INCLUDE=D:\\INCLUDE",
            "--env=LIB=D:\\LIB",
            "--drive=c",
            "--cwd-dos=C:\\",
            "D:\\BIN\\TCC.EXE",
            "-c",
            "-S",
            f"-nC:\\{asm_name}",
            f"C:\\{src_name}",
        ]
        if extra_flags:
            cmd[11:11] = extra_flags.split()
        res = subprocess.run(cmd, cwd=str(msex_root), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        asm_path = msex_root / rel.with_suffix(".ASM")
        cod_path = msex_root / cod_rel
        if asm_path.exists() and not cod_path.exists():
            cod_path.write_text(asm_path.read_text(errors="replace"), encoding="utf-8", errors="replace")
        ok = cod_path.exists()
        return ok, res.returncode, res.stdout

    cmd = [
        str(KVIKDOS),
        f"--mount=c:{src_dir}/",
        f"--mount=d:{compiler_dir}/",
        "--env=PATH=D:\\BIN",
        "--env=INCLUDE=D:\\INCLUDE",
        "--env=LIB=D:\\LIB",
        "--drive=c",
        "--cwd-dos=C:\\",
        "D:\\BIN\\CL.EXE",
        "/c",
        "/AS",
        f"/FcC:\\{cod_name}",
        f"C:\\{src_name}",
    ]
    if extra_flags:
        cmd[11:11] = extra_flags.split()
    res = subprocess.run(cmd, cwd=str(msex_root), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    ok = (msex_root / cod_rel).exists()
    return ok, res.returncode, res.stdout


def main():
    parser = argparse.ArgumentParser(description="Build all msex/*.C into .COD with KvikDOS + MSC fallbacks")
    parser.add_argument("--msex-root", default=str(MSEX_ROOT))
    parser.add_argument("--overrides", default=str(REPO_ROOT / "msex_compiler_overrides.csv"))
    parser.add_argument("--report", default=str(REPO_ROOT / "artifacts" / "msex_cod_build_report.json"))
    parser.add_argument("--log", default=str(REPO_ROOT / "artifacts" / "msex_cod_build.log"))
    parser.add_argument("--clean", action="store_true", help="Delete existing .COD files before build")
    args = parser.parse_args()

    msex_root = Path(args.msex_root).resolve()
    overrides = load_overrides(Path(args.overrides).resolve())
    compilers = installed_compilers()

    if not KVIKDOS.exists():
        raise SystemExit(f"kvikdos not found: {KVIKDOS}")
    if not msex_root.exists():
        raise SystemExit(f"msex root not found: {msex_root}")

    build_order = [c for c in DEFAULT_ORDER if c in compilers]
    if not build_order:
        raise SystemExit("No supported compilers found (expected MSC CL.EXE or Turbo C++ TCC.EXE)")

    c_files = sorted(msex_root.rglob("*.C"))

    if args.clean:
        for cod in msex_root.rglob("*.COD"):
            cod.unlink(missing_ok=True)

    Path(args.report).parent.mkdir(parents=True, exist_ok=True)

    results = []
    success = 0
    fail = 0

    with Path(args.log).open("w", encoding="utf-8") as logf:
        for c_file in c_files:
            rel = c_file.relative_to(msex_root).as_posix()
            override = overrides.get(rel, {})
            order = override.get("compilers", build_order)
            flags = override.get("flags", "")
            order = [c for c in order if c in compilers]
            if not order:
                order = build_order

            entry = {"file": rel, "attempts": [], "success": False, "compiler": None, "flags": flags}
            for compiler_name in order:
                ok, rc, output = compile_one(c_file, compiler_name, compilers[compiler_name], msex_root, flags)
                entry["attempts"].append({"compiler": compiler_name, "returncode": rc})
                logf.write(f"===== {rel} :: {compiler_name} rc={rc} =====\n{output}\n\n")
                if ok:
                    entry["success"] = True
                    entry["compiler"] = compiler_name
                    success += 1
                    break
            if not entry["success"]:
                fail += 1
            results.append(entry)
            print(f"[{success + fail}/{len(c_files)}] {'OK' if entry['success'] else 'FAIL'} {rel} ({entry['compiler'] or 'none'})")

    summary = {
        "msex_root": str(msex_root),
        "total_c_files": len(c_files),
        "success": success,
        "failed": fail,
        "default_compiler_order": build_order,
        "overrides_file": str(Path(args.overrides).resolve()),
        "results": results,
    }
    Path(args.report).write_text(json.dumps(summary, indent=2), encoding="utf-8")

    print(f"Done. success={success} failed={fail}")
    print(f"Report: {args.report}")
    print(f"Log:    {args.log}")


if __name__ == "__main__":
    main()
