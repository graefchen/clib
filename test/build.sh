#!/bin/bash
# Build script for testbed
set echo on

mkdir -p ../bin

# Get a list of all the .c files.
cFilenames=$(find . -type f -name "*.c")

# echo "Files:" $cFilenames

assembly="test"
compilerFlags="-g -fdeclspec -fPIC"
optimiseFlag="-O3"
# -fms-extensions 
# -Wall -Werror
includeFlags="-Isrc -I../lib/src/"
linkerFlags="-L../bin/ -llibrary -Wl,-rpath,."
defines="-D_DEBUG -DIMPORT"

echo "Building $assembly..."
echo clang $cFilenames $compilerFlags $optimiseFlag -o ../bin/$assembly $defines $includeFlags $linkerFlags
clang $cFilenames $compilerFlags $optimiseFlag -o ../bin/$assembly $defines $includeFlags $linkerFlags