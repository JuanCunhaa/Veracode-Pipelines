$ErrorActionPreference = "Stop"

$artifactRoot = Join-Path $env:BUILD_ARTIFACTSTAGINGDIRECTORY 'artifact'
Set-Location $artifactRoot

New-Item -ItemType Directory -Force -Path 'merged' | Out-Null

Write-Host ("Procurando arquivos .zip em {0}" -f (Join-Path $env:BUILD_ARTIFACTSTAGINGDIRECTORY 'artifact'))

$zips = Get-ChildItem -Filter *.zip -File -ErrorAction SilentlyContinue
if ($zips) {
    foreach ($zip in $zips) {
        $zipName = $zip.Name
        Write-Host ("Extraindo {0} para merged/" -f $zipName)
        Expand-Archive -Path $zip.FullName -DestinationPath 'merged' -Force
    }
}
else {
    Write-Host 'Nenhum arquivo .zip encontrado.'
}

$items = Get-ChildItem -Force | Where-Object { $_.Name -ne 'merged' -and $_.Extension -ne '.zip' }
foreach ($item in $items) {
    $itemName = $item.Name
    Write-Host ("Movendo {0} para merged/" -f $itemName)
    Move-Item -LiteralPath $item.FullName -Destination 'merged' -Force
}

Write-Host 'Compactando tudo em analysisPack.zip'
$tmpZip = Join-Path ([System.IO.Path]::GetTempPath()) 'analysisPack.zip'
if (Test-Path $tmpZip) { Remove-Item $tmpZip -Force }
Compress-Archive -Path (Join-Path 'merged' '*') -DestinationPath $tmpZip -Force

Write-Host ("Limpando {0}" -f (Join-Path $env:BUILD_ARTIFACTSTAGINGDIRECTORY 'artifact'))
Get-ChildItem -Force | Remove-Item -Recurse -Force

Move-Item -LiteralPath $tmpZip -Destination (Join-Path $artifactRoot 'analysisPack.zip') -Force

Write-Host ("Novo pacote pronto: {0}" -f (Join-Path $env:BUILD_ARTIFACTSTAGINGDIRECTORY 'artifact\analysisPack.zip'))
