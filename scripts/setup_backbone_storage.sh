#!/bin/bash
# ---------------------------------------------------------
# Script: setup_backbone_storage.sh
# Finalidade: Automação de RAID 1 e LVM para o Projeto Atlas
# Autor: rockygab
# ---------------------------------------------------------

set -e # Para o script em caso de erro

echo "--- [Iniciando Automação de Backbone Storage] ---"

# 1. Verificando dependências
if ! command -v mdadm &> /dev/null; then
    echo "[ERRO] mdadm não instalado. Instalando..."
    sudo dnf install mdadm -y
fi

# 2. Configurando RAID 1 (Simulação em sdb1 e sdc1)
echo "[INFO] Criando Array RAID 1..."
# O --run força a criação sem perguntar
sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdb1 /dev/sdc1 --run

# 3. Provisionando LVM sobre o RAID
echo "[INFO] Configurando LVM..."
sudo pvcreate /dev/md0
sudo vgcreate vg_backbone /dev/md0
sudo lvcreate -L 1G -n lv_dados vg_backbone

# 4. Formatando e Montando
echo "[INFO] Formatando volume XFS..."
sudo mkfs.xfs /dev/vg_backbone/lv_dados
sudo mkdir -p /mnt/backbone_data
sudo mount /dev/vg_backbone/lv_dados /mnt/backbone_data

echo "--- [Setup Concluído com Sucesso!] ---"
df -h | grep backbone
