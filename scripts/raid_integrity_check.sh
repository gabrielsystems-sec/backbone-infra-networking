#!/bin/bash
# ---------------------------------------------------------
# Script: raid_integrity_check.sh
# Finalidade: Verificacao de integridade do RAID
# ---------------------------------------------------------

echo "--- [Verificando Status do RAID] ---"

RAID_STATUS=$(cat /proc/mdstat)

if echo "$RAID_STATUS" | grep -q "\[_\]"; then
    echo "[ALERTA CRITICO] RAID em estado DEGRADADO!"
    echo "$RAID_STATUS"
else
    echo "[OK] RAID operando normalmente."
fi
