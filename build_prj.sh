#!/usr/bin/bash -exu
PRJPATH='bcex/crc16eas/Source/'
TARGET=CRC16.PRJ
MAK=$(echo "$TARGET" | perl -pe 's!\.PRJ!\.MAK!i')
CFG=$(echo "$TARGET" | perl -pe 's!\.PRJ!\.CFG!i')

CPPFILE='CRC16.CPP'
ASMFILE=$(echo "$CPPFILE" | perl -pe 's!\.CPP!\.ASM!i')

execute_dos()
{
  > output.txt
  > errorlvl.txt

  cat << EOF > cmd.bat
  echo on
  set PATH=%PATH%;C:\BorlandC\BIN
  mount d: $PRJPATH
  d:

  $*
  c:\errorlvl.com
  c:\errorlvl.com > c:\errorlvl.txt
 pause
  exit
EOF

  dosbox cmd.bat
  cat output.txt
  return $(cat errorlvl.txt)
}

convert_prj_to_make()
{
  MAKEFILE=$(echo "$1" | perl -pe 's!\.PRJ!\.MAK!i')
  execute_dos "PRJ2MAK $1 $MAKEFILE"
  return $?
}

build_make()
{
  execute_dos "MAKE -f $1"
  return $?
}

compile_cpp_to_asm()
{
  # $1 - cpp file
  # $2 - .cfg file
  execute_dos "BCC -S +$2 $1"
  # .asm - is an assembler source
  return $?
}

process_cpp_w_preprocessor()
{
  # $1 - cpp file
  # $2 - .cfg file
  execute_dos "CPP +$2 $1"
  # .i - is a preprocessed
  return $?
}

convert_asm_into_lst()
{
  # $1 - .asm file
  execute_dos "TASMX /la $1"
  # .lst - is a listing
  return $?
}

convert_prj_to_make "$TARGET"
build_make "$MAK"
compile_cpp_to_asm "$CPPFILE" "$CFG"
process_cpp_w_preprocessor "$CPPFILE" "$CFG"
convert_asm_into_lst "$ASMFILE"

exit "$(cat errorlvl.txt)"
