# AGENTS.md

## Purpose
`nndecomp` builds a data pipeline for learning 16-bit C/C++ decompilation. The repository is focused on:
- collecting legacy DOS C/C++ projects,
- compiling them with Borland/Turbo/MSC toolchains under emulation,
- capturing source + build artifacts (ASM/OBJ/EXE/logs) for downstream ML work.

Top-level intent is documented in `README.md` and `user_stories.md`.

## Repository Map
- `bcex/`, `tcex/`, `msex/`: primary source corpora (Borland/Turbo/Microsoft ecosystems).
- `msdos/`: large DOS codebase snapshot and related sources.
- `artifacts/`: build outputs, logs, extracted sources, binaries.
- `build_all.sh`: end-to-end smoke run for all three toolchains.
- `build_toolchain.py`: main DOSBox build orchestrator + artifact collection.
- `build_all_projects.py`: project-type detection and build dispatch (RAW_C/MAK/PRJ/BAT).
- `build_prj.sh`: PRJ->MAK->ASM flow example for a concrete Borland target.
- `build_utils.py`: shared logging/project detection/path conversion helpers.
- `dos_utility_caller/`: separate Python package for generic DOS utility invocation.
- `*.conf`: DOSBox and compiler environment configs.

## Execution Rules
- Prefer non-interactive, scriptable runs.
- Preserve compatibility with DOS constraints (8.3 filenames, uppercase output variants).
- Treat build logs and errorlevel artifacts as first-class outputs.
- Do not assume DOSBox shell behavior matches modern shell semantics (PATH/redirection/CALL are known pain points).

## RTK Command Prefix
This environment uses RTK. Prefix shell commands with `rtk` when executing manually.

Examples:
```bash
rtk python build_toolchain.py test_borland borland
rtk python build_toolchain.py test_turbo turbo
rtk python build_toolchain.py test_msc msc
rtk bash build_all.sh
```

## Canonical Workflows
1. Single toolchain/project run:
```bash
rtk python build_toolchain.py <project_dir> <borland|turbo|msc>
```
2. Full smoke run:
```bash
rtk bash build_all.sh
```
3. PRJ conversion pipeline example:
```bash
rtk bash build_prj.sh
```

## Expected Outputs
For each built project under `artifacts/<project>/` expect:
- `dosbox.log` and/or `build.log`
- copied `logs/` (`*.log`, `*.err`, `*.txt`, errorlevel files)
- `sources/` snapshot
- `binaries/` (`*.exe`, `*.com`, `*.obj`)

If binaries are missing, treat as build failure even if DOSBox exits cleanly.

## Safe Change Guidelines
- Keep compiler-specific behavior explicit (Borland/Turbo/MSC diverge).
- Prefer absolute/controlled paths over implicit PATH assumptions inside DOS contexts.
- Avoid broad refactors across corpus directories unless requested.
- Do not delete or rewrite large source corpora in `bcex/`, `tcex/`, `msex/`, `msdos/`.
- When touching build automation, validate on at least one representative project per toolchain.

## Validation Checklist
After automation changes:
1. Run one targeted project build with the affected toolchain.
2. Confirm artifacts were collected in `artifacts/`.
3. Check logs for command-not-found, missing mount, and redirection failures.
4. Confirm exit/errorlevel handling still works.

## Known Gaps
- `README.md` still lists major TODOs for preprocessing, corpus normalization, and model training.
- `build_all_projects.py` has placeholder logic for `.MAK` conversion.
- DOSBox compatibility issues are documented in `MSC_BUILD_SUMMARY.md` and should be considered current constraints unless revalidated.
