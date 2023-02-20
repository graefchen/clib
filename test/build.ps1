# Build script for the testbed
# set-PSDebug -Trace 1

$cFilenames = (Get-ChildItem -Recurse -Include *.c)

$assembly = "test"
$compilerFlags = "-g"
# REM -Wall -Werror
$includeFlags = "-Isrc -I ../lib/src/"
$linkerFlags = "-L ../bin/ -l library.lib"
$defines = "-D_DEBUG -DIMPORT"

Write-Output "Building $assembly..."
$callClang = "clang $cFilenames $compilerFlags -o ../bin/$assembly.exe $defines $includeFlags $linkerFlags"
Invoke-Expression $callClang
