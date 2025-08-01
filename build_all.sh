#!/bin/bash

# Create artifacts directory if it doesn't exist
mkdir -p artifacts

# Test Borland compiler and build projects
echo "Testing Borland C..."
dosbox -conf borland.conf -c "bcc /? > bcc_help.txt" --exit
python build_toolchain.py test_borland borland
python build_toolchain.py bc31 borland
mv bcc_help.txt artifacts/

# Test Turbo C++ compiler and build projects
echo "Testing Turbo C++..."
dosbox -conf turbo.conf -c "tcc /? > tcc_help.txt" --exit
python build_toolchain.py test_turbo turbo
python build_toolchain.py tc301 turbo
mv tcc_help.txt artifacts/

# Test Microsoft C compiler and build projects
echo "Testing Microsoft C..."
dosbox -conf msc.conf -c "cl /? > cl_help.txt" --exit
python build_toolchain.py test_msc msc
python build_toolchain.py msdos msc
mv cl_help.txt artifacts/

# Collect build logs
cp build_logs/*.log artifacts/ 2>/dev/null

echo "All tests completed. Artifacts available in: artifacts/"