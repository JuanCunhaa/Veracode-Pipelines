# APIID e APIKEY nos variable group

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest
$APIID  = if (-not [string]::IsNullOrWhiteSpace($env:APIID))  { $env:APIID }  else { "$(APIID)" }
$APIKEY = if (-not [string]::IsNullOrWhiteSpace($env:APIKEY)) { $env:APIKEY } else { "$(APIKEY)" }
if ([string]::IsNullOrWhiteSpace($APIID))  { Write-Host "❌ APIID não definido." }  else { Write-Host "✅ APIID encontrado." }
if ([string]::IsNullOrWhiteSpace($APIKEY)) { Write-Host "❌ APIKEY não definido." } else { Write-Host "✅ APIKEY encontrado." }
$ART = Join-Path $env:BUILD_ARTIFACTSTAGINGDIRECTORY 'artifact\analysisPack.zip'
if (-not (Test-Path $ART)) {
  throw "Artefato não encontrado: $ART"
}
Write-Host "Running Veracode Pipeline Scan CLI..."
$zip = "pipeline-scan-LATEST.zip"
Invoke-WebRequest -Uri "https://downloads.veracode.com/securityscan/pipeline-scan-LATEST.zip" -OutFile $zip -UseBasicParsing
if (Test-Path "pipeline-scan") { Remove-Item -Recurse -Force "pipeline-scan" }
Expand-Archive -Path $zip -DestinationPath "pipeline-scan" -Force
& java -jar "pipeline-scan\pipeline-scan.jar" `
  -vid $APIID `
  -vkey $APIKEY `
  -f $ART `
  --json_output true `
  --issue_details true
if ($LASTEXITCODE -ne 0) { throw "Pipeline Scan falhou com exit code $LASTEXITCODE" }
Write-Host "✅ Pipeline Scan finalizado."