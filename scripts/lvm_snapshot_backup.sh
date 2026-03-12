#!/bin/bash
# ---------------------------------------------------------
# Script: lvm_snapshot_backup.sh
# Finalidade: Criacao de Snapshots LVM para backup preventivo
# ---------------------------------------------------------

VG_NAME="vg_dados"
LV_NAME="lv_backups"
SNAP_NAME="snap_preventivo_$(date +%Y%m%d)"

echo "--- [Iniciando Snapshot LVM] ---"

# Criando snapshot de 1GB (ajustável)
sudo lvcreate -L 100M -s -n $SNAP_NAME /dev/$VG_NAME/$LV_NAME

if [ $? -eq 0 ]; then
    echo "[SUCESSO] Snapshot $SNAP_NAME criado."
else
    echo "[ERRO] Falha ao criar snapshot. Verifique o espaco no VG."
fi
