# Veracode Pipelines

Este repositório reúne **modelos e scripts prontos** para integrar análises de segurança da **Veracode** em pipelines de **CI/CD**, com suporte para **GitHub Actions** e **Azure DevOps**.

O objetivo é fornecer exemplos reutilizáveis e adaptáveis para equipes que desejam automatizar:
- **SCA (Software Composition Analysis)** – análise de bibliotecas e dependências.
- **Pipeline Scan** – detecção rápida de vulnerabilidades no código-fonte.
- **Upload & Scan** – envio de pacotes para análise completa na plataforma Veracode.

## 📂 Estrutura do Repositório
- **`AzureDevOps/`** – exemplos para integração no Azure DevOps:
  - **Task Groups** prontos para importação.
  - Pipelines em **YAML puro** para execução direta.
  - Scripts em PowerShell e Bash.
- **`GitHub/`** – workflows para execução em GitHub Actions.
- **Scripts utilitários** – automações para empacotamento, download e upload de artefatos.

## 🚀 Recursos Demonstrados
- Configuração de variáveis de ambiente e secrets no CI/CD.
- Execução de scans diretamente no pipeline.
- Geração de relatórios **JSON** e **SARIF** para integração com alertas de segurança.
- Uso de artefatos intermediários para empacotamento e análise.
- Suporte a múltiplos sistemas operacionais (Linux e Windows).

---
