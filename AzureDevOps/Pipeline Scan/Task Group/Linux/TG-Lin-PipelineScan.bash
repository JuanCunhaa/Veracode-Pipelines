# APIID e APIKEY nos variable group

set -euo pipefail

ART="$(Build.ArtifactStagingDirectory)/artifact/analysisPack.zip"

echo "Running Veracode Pipeline Scan CLI..."
curl -sSLo pipeline-scan-LATEST.zip https://downloads.veracode.com/securityscan/pipeline-scan-LATEST.zip
unzip -oq pipeline-scan-LATEST.zip -d pipeline-scan

java -jar pipeline-scan/pipeline-scan.jar \
  -vid "$APIID" \
  -vkey "$APIKEY" \
  -f "$ART" \
  --json_output true \
  --issue_details true

echo "✅ Pipeline Scan finalizado."