#!/bin/bash
# ---------------------------------------------------------
# Script: monitor_backbone_health.sh
# Finalidade: Monitoramento e Auto-Recuperação (Backbone Atlas)
# ---------------------------------------------------------

LOG_FILE="/var/log/backbone_monitor.log"

echo "[$(date)] --- Iniciando Verificação de Saúde ---" | tee -a $LOG_FILE

# 1. Checagem do RAID 1
RAID_STATUS=$(cat /proc/mdstat | grep "\[UU\]" || echo "FALHA")
if [ "$RAID_STATUS" == "FALHA" ]; then
    echo "[ALERTA] Array RAID degradado! Verificando discos..." | tee -a $LOG_FILE
    # Aqui poderia entrar um comando de envio de e-mail ou log crítico
else
    echo "[OK] RAID 1 operando em sincronia." | tee -a $LOG_FILE
fi

# 2. Checagem de Espaço em Disco (LVM)
THRESHOLD=80
USAGE=$(df -h /mnt/backbone_data | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "[ALERTA] Uso de disco acima de $THRESHOLD% ($USAGE%). Necessário expansão LVM." | tee -a $LOG_FILE
else
    echo "[OK] Espaço em disco dentro dos limites ($USAGE%)." | tee -a $LOG_FILE
fi

# 3. Verificação do Serviço DHCP (Core Service)
if ! systemctl is-active --quiet dhcpd; then
    echo "[RECUPERAÇÃO] DHCP inativo. Tentando reiniciar..." | tee -a $LOG_FILE
    sudo systemctl restart dhcpd
    sleep 2
    if systemctl is-active --quiet dhcpd; then
        echo "[SUCESSO] DHCP restaurado." | tee -a $LOG_FILE
    fi
else
    echo "[OK] Serviço DHCP ativo." | tee -a $LOG_FILE
fi

echo "[$(date)] --- Verificação Concluída ---" | tee -a $LOG_FILE
