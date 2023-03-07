REM Build script for the test
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files.
SET cFilenames=
FOR /R %%f in (*.c) do (
	SET cFilenames=!cFilenames! %%f
)

REM echo "Files:" %cFilenames%

SET assembly=test
SET compilerFlags=-g
SEt optimiseFlag="-O3"
REM -Wall -Werror
SET includeFlags=-Isrc -I../lib/src/
SET linkerFlags=-L../bin/ -llibrary.lib
SET defines=-D_DEBUG -DIMPORT

ECHO "Building %assembly%%..."
clang %cFilenames% %compilerFlags% %optimiseFlag% -o ../bin/%assembly%.exe %defines% %includeFlags% %linkerFlags%