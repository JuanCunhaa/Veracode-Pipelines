$ErrorActionPreference = "Stop"
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://tools.veracode.com/veracode-cli/install.ps1'))
New-Item -ItemType Directory -Force -Path "$env:BUILD_ARTIFACTSTAGINGDIRECTORY\artifact" | Out-Null
veracode package --source . --type directory --output "$env:BUILD_ARTIFACTSTAGINGDIRECTORY\artifact" --trust --verbose