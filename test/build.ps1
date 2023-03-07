# Build script for the testbed
# set-PSDebug -Trace 1

$cFilenames = (Get-ChildItem -Recurse -Include *.c)

$assembly = "test"
$compilerFlags = "-g"
$optimiseFlag="-O3"
# REM -Wall -Werror
$includeFlags = "-Isrc -I ../lib/src/"
$linkerFlags = "-L ../bin/ -l library.lib"
$defines = "-D_DEBUG -DIMPORT"

Write-Output "Building $assembly..."
$callClang = "clang $cFilenames $compilerFlags $optimiseFlag -o ../bin/$assembly.exe $defines $includeFlags $linkerFlags"
Invoke-Expression $callClang
