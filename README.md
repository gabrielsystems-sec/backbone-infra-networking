# 🚀 Repo 4: System Health, Observability & Tuning 🛡️

Repositório dedicado à construção e administração de infraestrutura Linux. Este laboratório documenta a implementação de sistemas escaláveis e resilientes utilizando **Rocky Linux 9** e **Ubuntu Server**.

### 📊 Status e Validação Real
* **Status:** 🛠️ Laboratório em evolução ativa (Atualizado em 07/03/2026).
* **Ambiente:** Terminal `rockygab` (Validação em tempo real).
* **Evidência de Sessão:** [Clique aqui para ver o CAT deste README direto no terminal](./evidencias_repo4/readme-structure-backbone-v1.png)

---

### 📂 Módulos de Implementação e Casos de Uso

#### 1. LVM e Escalabilidade de Armazenamento (Hot-Resize)
Simulação de cenário crítico de esgotamento de disco em ambiente de produção.
* **Problema:** Volume `lv_backups` atingiu 100% de ocupação (1.00 GiB).
* **Solução:** Expansão dinâmica via `lvextend` e redimensionamento online de metadados XFS no Rocky Linux.
* **Evidências:** [Ver metadados do XFS](./evidencias_repo4/xfs-growfs-success-metadata-lv-backups.png) | [Verificação final df -h](./evidencias_repo4/df-h-final-verification-lv-backups-1.1G.png)

#### 2. Troubleshooting de Kernel e Hardware
Registro de tratamento de bloqueios de dispositivo e identificação de metadados durante o particionamento.
* **Evidência Técnica:** [Ver alerta do fdisk](./evidencias_repo4/fdisk-warning-disk-in-use-sdc.png)

---

### 🗺️ Roadmap de Evolução Técnica (Checklist de Carreira)

#### **Camada de Dados e Redundância**
- [x] LVM2: Gerenciamento de PV, VG e LV.
- [x] Expansão online de File Systems (XFS).
- [ ] **RAID 1 (Espelhamento):** Configuração de redundância física.
- [ ] **OpenZFS:** Implementação de sistemas de arquivos avançados.

#### **Conectividade e Redes Enterprise**
- [ ] Gestão de rede via CLI (`nmcli` / `nmtui`) no RHEL/Rocky.
- [ ] Configuração de IP Estático e Hostnames.
- [ ] Troubleshooting de rede (`MTR`, `fping`).

#### **[PRÓXIMO] Serviços e Boot do Sistema**
- [ ] **DNS Master/Slave (BIND9):** Resolução de nomes.
- [ ] **DHCP & FTP:** Automação e transferência de arquivos.
- [ ] **GRUB:** Personalização e segurança no bootloader.

---

### 🛠️ Lab Setup (Setup Profissional)
* **Terminal:** `rockygab` (Garante a autenticidade das evidências).
* **S.O.:** Rocky Linux 9 (Enterprise Ready) e Ubuntu Server (Nativo).
