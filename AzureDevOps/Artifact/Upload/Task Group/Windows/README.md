# 📦 Uso de Artifact Upload e Artifact Download em Task Groups no Azure DevOps

Este guia explica como utilizar as tarefas **Publish Pipeline Artifact** (upload) e **Download Pipeline Artifact** (download) do próprio Azure DevOps dentro de **Task Groups**, garantindo que arquivos gerados no pipeline sejam compartilhados entre estágios ou jobs.

---

## 1️⃣ Upload de Artefato

Para enviar um arquivo ou pasta gerada no pipeline para ser utilizada posteriormente, utilize a task **Publish Pipeline Artifact** do Azure DevOps.

### Exemplo no Task Group:
- Adicione a task **Publish Pipeline Artifact**.
- Configure:
  - **Path to publish** → Caminho do arquivo ou pasta que você quer enviar (ex.: `$(Build.ArtifactStagingDirectory)/artifact/analysisPack.zip`).
  - **Artifact name** → Nome que você deseja dar ao artefato (ex.: `analysisPack`).
  - **Publish location** → Mantenha como `Pipeline`.

---

## 2️⃣ Download de Artefato

Para baixar o artefato em outro estágio ou job, use a task **Download Pipeline Artifact**.

### Exemplo no Task Group:
- Adicione a task **Download Pipeline Artifact**.
- Configure:
  - **Artifact name** → O mesmo nome definido no upload (ex.: `analysisPack`).
  - **Target path** → Caminho local onde o artefato será baixado (ex.: `$(Build.ArtifactStagingDirectory)/artifact`).

---

## 3️⃣ Boas Práticas
- Sempre use **variáveis de sistema** como `$(Build.ArtifactStagingDirectory)` para garantir compatibilidade entre agentes.
- Mantenha nomes de artefatos claros e consistentes entre upload e download.
- Para múltiplos arquivos, envie uma **pasta** inteira ao invés de arquivos soltos.

---

## 📌 Observação
Estas tasks já estão disponíveis no Azure DevOps, não sendo necessário instalar extensões no Marketplace.
