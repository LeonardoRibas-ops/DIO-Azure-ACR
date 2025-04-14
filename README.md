# 📝 Blog App com Azure Container Apps ☁️🚀

![Azure](https://img.shields.io/badge/Azure-Container%20Apps-blue?logo=microsoft-azure&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue?logo=docker)
![CI/CD](https://img.shields.io/github/actions/workflow/status/SEU_USUARIO/NOME_REPOSITORIO/deploy.yml?label=CI%2FCD&style=flat&logo=github)
![License](https://img.shields.io/badge/license-MIT-green)

> Uma aplicação de blog simples, segura e escalável, rodando em **Azure Container Apps** com backend Python, Docker, banco PostgreSQL e infraestrutura como código. 😎

---

## 📸 Visão Geral

✨ API REST para gerenciar posts  
🧱 Infraestrutura com **Bicep**  
📦 Contêiner com **Docker**  
☁️ Hospedado em **Azure Container Apps**  
🧠 Banco de dados em **Azure PostgreSQL**  
⚙️ Deploy automático com **GitHub Actions**

---

## 📂 Estrutura do Projeto

```plaintext
blog-app-azure/
├── backend/
│   ├── app.py                # API Flask
│   ├── models.py             # ORM SQLAlchemy
│   ├── db.py                 # Conexão PostgreSQL
│   ├── requirements.txt
│   └── Dockerfile
├── infrastructure/
│   └── bicep/
│       └── main.bicep        # IaC: PostgreSQL + Container App
├── .github/
│   └── workflows/
│       └── deploy.yml        # CI/CD com Docker + Azure
├── openapi.yaml              # (opcional) Documentação da API
└── README.md
