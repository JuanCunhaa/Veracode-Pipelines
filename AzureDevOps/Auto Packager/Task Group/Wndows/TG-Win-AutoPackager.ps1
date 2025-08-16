$ErrorActionPreference = "Stop"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

iwr -UseBasicParsing -Uri "https://tools.veracode.com/veracode-cli/install.ps1" | iex

$outDir = Join-Path $env:BUILD_ARTIFACTSTAGINGDIRECTORY 'artifact'
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

veracode package --source . --output "$outDir" --trust --verbose
