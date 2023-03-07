#!/bin/bash
# Build script for library
set echo on

mkdir -p ../bin

# Get a list of all the .c files.
cFilenames=$(find . -type f -name "*.c")

# echo "Files:" $cFilenames

assembly="library"
compilerFlags="-g -shared -fdeclspec -fPIC"
optimiseFlag="-O3"
# -fms-extensions 
# -Wall -Werror
defines="-D_DEBUG -DEXPORT"

echo "Building $assembly..."
clang $cFilenames $compilerFlags $optimiseFlag -o ../bin/lib$assembly.so $defines