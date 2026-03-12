#!/bin/bash
# ---------------------------------------------------------
# Script: network_backup_manager.sh
# Finalidade: Backup automatico de configuracoes de rede e DHCP
# ---------------------------------------------------------

BACKUP_DIR="/var/backups/network_atlas"
sudo mkdir -p $BACKUP_DIR

echo "[$(date)] Iniciando backup de rede..."

# Backup das interfaces de rede (Rocky Linux/RHEL)
sudo cp -r /etc/sysconfig/network-scripts/ $BACKUP_DIR/interfaces_$(date +%F)

# Backup da config do DHCP Server
if [ -f /etc/dhcp/dhcpd.conf ]; then
    sudo cp /etc/dhcp/dhcpd.conf $BACKUP_DIR/dhcpd_$(date +%F).conf
fi

echo "[SUCESSO] Backups de rede salvos em $BACKUP_DIR"
