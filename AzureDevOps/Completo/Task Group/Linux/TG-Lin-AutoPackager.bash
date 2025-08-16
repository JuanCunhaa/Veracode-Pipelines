mkdir -p artifacts

echo "📦 Gerando analysisPack.zip via Veracode CLI..."
curl -fsS https://tools.veracode.com/veracode-cli/install | sh
./veracode configure --api-id "$(APIID)" --api-key "$(APIKEY)"
./veracode package --source . --output $(Build.ArtifactStagingDirectory)/artifact --trust --verbose
