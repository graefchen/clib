# Build script for the library
# set-PSDebug -Trace 1

$cFilenames = (Get-ChildItem -Recurse -Include *.c)

$assembly = "library"
$compilerFlags = "-g -shared -Wvarargs -Wall -Werror"
$optimiseFlag="-O3"
$defines = "-D_DEBUG -DEXPORT -D_CRT_SECURE_NO_WARNING"

Write-Output "Building $assembly..."
$callClang = "clang $cFilenames $compilerFlags $optimiseFlag -o ../bin/$assembly.dll $defines"
Invoke-Expression $callClang