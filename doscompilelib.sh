execute_dos()
{
  > output.txt
  > errorlvl.txt

  cat << EOF > cmd.bat
  echo on
  set PATH=%PATH%;C:\BorlandC\BIN
  mount d: $PRJPATH
  d:

  $* > c:\output.txt
  c:\errorlvl.com > c:\errorlvl.txt
rem pause
  exit
EOF

  dosbox cmd.bat
  cat errorlvl.txt
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
  #execute_dos "MAKE -n $1" 
  #cat output.txt > makecmds.bat
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

compile_cpp_to_obj()
{
  # $1 - cpp file
  # $2 - .cfg file
  execute_dos "BCC -c +$2 $1"
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
