#!/bin/bash
# ---------------------------------------------------------
# Script: backbone_service_check.sh
# Finalidade: Validar DNS, DHCP e conectividade externa
# ---------------------------------------------------------

echo "--- [Backbone Health Check] ---"

# 1. Teste de DNS (Resolução Interna)
host google.com > /dev/null
if [ $? -eq 0 ]; then
    echo "[OK] Resolucao DNS funcionando."
else
    echo "[ERRO] Falha na resolucao DNS."
fi

# 2. Teste de DHCP (Verifica se o processo está rodando)
if systemctl is-active --quiet dhcpd; then
    echo "[OK] Servico DHCP ativo."
else
    echo "[ALERTA] Servico DHCP parado ou nao instalado."
fi

echo "--- [Fim do Check] ---"
