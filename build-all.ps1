# Build everything
# set-PSDebug -Trace 1

Write-Output "Building everything..."

Push-Location .\lib
./build.ps1
Pop-Location
if ($LASTEXITCODE -cne 0) {
	Write-Output "Error: $LASTEXITCODE"
	exit
}

Push-Location .\test
./build.ps1
Pop-Location
if ($LASTEXITCODE -cne 0) {
	Write-Output "Error: $LASTEXITCODE"
	exit
}

Write-Output "All assemblies built successfully."