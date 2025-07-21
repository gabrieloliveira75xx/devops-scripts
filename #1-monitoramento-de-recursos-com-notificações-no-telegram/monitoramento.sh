#!/bin/bash

# =================== CONFIGURAÇÕES ===================

# Limites (em porcentagem)
LIMITE_CPU=85
LIMITE_MEMORIA=90
LIMITE_DISCO=90

# Telegram
TELEGRAM_BOT_TOKEN="SEU_TOKEN_AQUI"
TELEGRAM_CHAT_ID="SEU_CHAT_ID_AQUI"

# Slack
SLACK_WEBHOOK_URL="SUA_WEBHOOK_URL_AQUI"

# =================== FUNÇÕES ===================

enviar_telegram() {
  local MENSAGEM="$1"
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_CHAT_ID" \
    -d text="$MENSAGEM" \
    -d parse_mode="Markdown"
}

enviar_slack() {
  local MENSAGEM="$1"
  curl -s -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MENSAGEM\"}" "$SLACK_WEBHOOK_URL"
}

# =================== MONITORAMENTO ===================

CPU_ATUAL=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEMORIA_ATUAL=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISCO_ATUAL=$(df / | grep / | awk '{print $5}' | sed 's/%//')

HOST=$(hostname)
DATA=$(date "+%d/%m/%Y %H:%M:%S")

ALERTA="*🚨 Alerta de uso excessivo - $HOST*"
ALERTA+="\n_Data:_ $DATA"
OCORRENCIA=0

if (( $(echo "$CPU_ATUAL > $LIMITE_CPU" | bc -l) )); then
  ALERTA+="\n⚠️ CPU em ${CPU_ATUAL%.*}% (limite: $LIMITE_CPU%)"
  ((OCORRENCIA++))
fi

if (( $(echo "$MEMORIA_ATUAL > $LIMITE_MEMORIA" | bc -l) )); then
  ALERTA+="\n⚠️ Memória em ${MEMORIA_ATUAL%.*}% (limite: $LIMITE_MEMORIA%)"
  ((OCORRENCIA++))
fi

if (( DISCO_ATUAL > LIMITE_DISCO )); then
  ALERTA+="\n⚠️ Disco em ${DISCO_ATUAL}% (limite: $LIMITE_DISCO%)"
  ((OCORRENCIA++))
fi

# =================== ENVIO DE ALERTA ===================

if (( OCORRENCIA > 0 )); then
  enviar_telegram "$ALERTA"
  enviar_slack "$ALERTA"
fi
