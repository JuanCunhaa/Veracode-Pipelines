set -e
 
cd "$(Build.ArtifactStagingDirectory)/artifact"
 
mkdir -p merged
 
echo "Procurando arquivos .zip em $(Build.ArtifactStagingDirectory)/artifact"
shopt -s nullglob
zips=( *.zip )
if [ ${#zips[@]} -gt 0 ]; then
  for zip in "${zips[@]}"; do
    echo "Extraindo $zip para merged/"
    unzip -oq "$zip" -d merged/
  done
else
  echo "Nenhum arquivo .zip encontrado."
fi
 
for item in *; do
  if [[ "$item" != "merged" && "$item" != *.zip ]]; then
    echo "Movendo $item para merged/"
    mv "$item" merged/
  fi
done
 
echo "Compactando tudo em analysisPack.zip"
rm -f /tmp/analysisPack.zip
(cd merged && zip -qr /tmp/analysisPack.zip .)
 
echo "Limpando $(Build.ArtifactStagingDirectory)/artifact"
rm -rf ./*
 
mv /tmp/analysisPack.zip ./analysisPack.zip
 
echo "Novo pacote pronto: $(Build.ArtifactStagingDirectory)/artifact/analysisPack.zip"