# Adicionar como Environment Variables o SRCCLR_API_TOKEN

$ErrorActionPreference = "Stop"

Write-Host "🔍 Rodando Veracode SCA..."

$wc = New-Object System.Net.WebClient
try {
  $ci = $wc.DownloadString('https://sca-downloads.veracode.com/ci.ps1')
} catch {
  $ci = $wc.DownloadString('https://download.sourceclear.com/ci.ps1')
}

Invoke-Expression $ci

& srcclr scan

Write-Host "✅ SCA finalizado."