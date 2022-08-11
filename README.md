# nndecomp

Neural network 16bit C/C++ decompiler

TODO:

[x] Collect C++ sources of 16 bit code

[ ] Prepare build environment to convert .CPP into assembler. Prepare compilation validators

[ ] Adopt compilers input/output to analyze with CRNN

[ ] Train CRNN with compilers input/output

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



