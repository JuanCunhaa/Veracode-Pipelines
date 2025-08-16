# Veracode - Upload and Scan no Azure DevOps

Para utilizar o **Upload and Scan** no Azure DevOps, utilize a task **Veracode Upload and Scan**, que funciona tanto para **Windows** quanto para **Linux**.

## Configuração

1. Adicione a task **Veracode Upload and Scan** no seu pipeline.
2. Atualize as variáveis obrigatórias:
   - **APIID** → Seu ID de API da conta Veracode.
   - **APIKEY** → Sua chave de API da conta Veracode.
   - **FilePath** → Caminho para o arquivo/artefato que será enviado para análise.
3. Configure as opções adicionais de acordo com a sua necessidade.

> 💡 **Dica:** Certifique-se de armazenar `APIID` e `APIKEY` de forma segura no **Azure DevOps** (Library, Variable Groups ou Pipeline Secrets).
