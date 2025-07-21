<h1 align="center">Monitoramento de Recursos com Alertas via Telegram e Slack</h1>

<p align="center">
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-green" alt="License: MIT">
  </a>
  <a href="https://github.com/gabrieloliveira75xx/devops-scripts">
    <img src="https://img.shields.io/github/repo-size/gabrieloliveira75xx/devops-scripts?style=flat-square" alt="Repo size">
  </a>
  <a href="https://github.com/gabrieloliveira75xx/devops-scripts/commits/main">
    <img src="https://img.shields.io/github/last-commit/gabrieloliveira75xx/devops-scripts?style=flat-square" alt="Last Commit">
  </a>
</p>

---

## 📋 Sobre o Projeto

Este script em Bash realiza o monitoramento de **uso de CPU**, **memória RAM** e **disco**, gerando **alertas automáticos via Telegram e Slack** sempre que algum desses recursos ultrapassar o limite definido.

É uma solução prática e leve para quem deseja monitorar servidores Linux e receber notificações em tempo real, sem depender de soluções externas complexas.

Ideal para sysadmins, DevOps e entusiastas que desejam manter um controle básico de saúde da infraestrutura com scripts simples e personalizáveis.

---

## 🚀 Funcionalidades

- ✅ Monitoramento de CPU, RAM e disco
- 📩 Notificações automáticas via **Telegram Bot API** e **Slack Webhooks**
- 🔁 Suporte a execução periódica via `cron`
- 🔧 Script fácil de adaptar e integrar com outros sistemas
- 📊 Relatórios com hostname e data/hora

---

## 🛠️ Tecnologias Utilizadas

- **Bash scripting**
- **curl** (para integração com APIs)
- **cron** (agendamento de tarefas)
- **Telegram Bot API**
- **Slack Webhooks**
- Ferramentas nativas do Linux: `top`, `free`, `df`, `systemctl`, `awk`

---

## ✅ Como usar:

1. **Substitua as variáveis no script:**
   - `TELEGRAM_BOT_TOKEN`
   - `TELEGRAM_CHAT_ID`
   - `SLACK_WEBHOOK_URL`

2. **Salve o script como** `monitoramento.sh`

3. **Dê permissão de execução:**
   ```bash
   chmod +x monitoramento.sh
