REM Build script for the library
@ECHO OFF
setLocal EnableDelayedExpansion

REM Get a list of all the .c files.
SET cFilenames=
FOR /R %%f in (*.c) do (
	SET cFilenames=!cFilenames! %%f
)

REM echo "Files: %cFilenames%"

SET assembly=library
SET compilerFlags=-g -shared -Wvarargs -Wall -Werror
REM -Wall -Werror
SET defines=-D_DEBUG -DEXPORT -D_CRT_SECURE_NO_WARNING

ECHO "Building %assembly%%..."
clang %cFilenames% %compilerFlags% -o ../bin/%assembly%.dll %defines%