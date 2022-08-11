#!/usr/bin/bash -exu
PRJPATH='bcex/crc16eas/Source/'
TARGET=CRC16.PRJ
MAK=$(echo "$TARGET" | perl -pe 's!\.PRJ!\.MAK!i')
CFG=$(echo "$TARGET" | perl -pe 's!\.PRJ!\.CFG!i')

CPPFILE='CRC16.CPP'
ASMFILE=$(echo "$CPPFILE" | perl -pe 's!\.CPP!\.ASM!i')

. doscompilelib.sh

rm "$PRJPATH/$ASMFILE" || true
convert_prj_to_make "$TARGET"
build_make "$MAK"
compile_cpp_to_asm "$CPPFILE" "$CFG"
process_cpp_w_preprocessor "$CPPFILE" "$CFG"
convert_asm_into_lst "$ASMFILE"

exit "$(cat errorlvl.txt)"
