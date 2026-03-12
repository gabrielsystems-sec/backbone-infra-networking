# Repo 4: Backbone Infrastructure & Networking 🛡️

Repositório dedicado à construção e administração de infraestrutura Linux avançada. Este laboratório documenta a implementação de serviços críticos, escaláveis e resilientes utilizando **Rocky Linux 9 (Enterprise Ready)** e **Ubuntu Server**.

---

## 🛠️ Stack Tecnológica & Topologia
* **Distribuições:** Rocky Linux 9 & Ubuntu Server
* **Armazenamento Avançado:** RAID 1 (Mirroring), RAID 10 (Striping + Mirroring) e LVM2.
* **Segurança:** GRUB2 (Hardening com PBKDF2).
* **Serviços Core:** BIND9 (DNS), ISC DHCP, Dovecot (Mail), ProFTPD.

### Endereçamento e Funções
| Serviço | Interface | Rede/Volume | Função |
| :--- | :--- | :--- | :--- |
| **DHCP/DNS Server** | eth1 | 192.168.10.0/24 | Gestão de Identidade e IPs da Rede |
| **Mirroring Storage** | md1 | RAID 1 (2 Discos) | Dados Críticos e Redundância |
| **Performance Cluster**| md127| RAID 10 (4 Discos)| Alta Performance e Tolerância a Falhas |
| **LVM Snapshots** | vg_dados| lv_backups | Salvaguarda de Dados (Point-in-Time) |

---

## 1. Gestão de Endereçamento e Serviços de Borda
Implementação de serviços autoritativos para gestão centralizada de rede local e mensageria.

* **DHCP:** Controle de escopo e garantia de persistência.
* **DNS/Mail:** Zonas Master e autenticação Dovecot via Telnet.

<details>
<summary>📂 Evidências de Serviços (DNS, DHCP, Mail & FTP)</summary>

* **DHCP Status:** ![Operacional](./docs/assets/02-atlas-dhcp-validation-and-status.png)
* **DNS Zone:** ![DNS Zone](./docs/assets/DNS_Validation_Master_Zone.png)
* **Mail IMAP:** ![Dovecot Status](./docs/assets/Dovecot_IMAP_POP3_Verification.png)
* **FTP Final:** ![FTP Success](./docs/assets/FTP_Final_Success.png)
</details>

---

## 2. Armazenamento de Alta Disponibilidade (RAID 1, 10 & LVM)
O pilar de **Disponibilidade** é garantido por múltiplos níveis de RAID e gestão flexível de volumes.

### 2.1. RAID 10 e Gestão de Volume
* **Diferencial:** Implementação de RAID 10 para balancear performance de leitura/escrita com segurança.
* **Metodologia:** Expansão dinâmica via `lvextend` e `xfs_growfs`.

---

## 3. [GOLDEN EVIDENCE] SRE Troubleshooting: Resiliência de Dados
Cenário real de tratamento de incidente em storage crítico.

**Cenário:** Falha simulada no disco `sdi` do array RAID 1.
1. **Identificação:** O sistema sinalizou degradação no status `[U_]` do device `md1`.
2. **Mitigação (Snapshot):** Antes do reparo, foi executado o script `lvm_snapshot_backup.sh` para criar uma salvaguarda dos dados.
3. **Resolução:** Remoção do disco `faulty` e início do `rebuild` via `mdadm`.

### 📸 Evidências do Incidente:
* **O Incidente:** ![RAID Degradado](./docs/assets/sre-incident-raid-degradation.png)
* **A Resolução:** ![Snapshot e Rebuild](./docs/assets/sre-troubleshoot-lvm-raid-resilience.png)

---

## 4. Hardening de Bootloader (GRUB2 Security)
Proteção contra ataques físicos e edição de kernel não autorizada.
* **Segurança:** Hash **PBKDF2** forçando autenticação no GRUB.
* **Evidência:** ![GRUB Config](./docs/assets/grub-security-config-pbkdf2.png)

---

## 🤖 Automações de Infraestrutura (IaC & SRE)
Scripts desenvolvidos para garantir a operabilidade do Backbone:

* **[setup_backbone_storage.sh](./scripts/setup_backbone_storage.sh):** Provisionamento de RAID, VG e File System.
* **[monitor_backbone_health.sh](./scripts/monitor_backbone_health.sh):** Verificação de RAID e Self-healing.
* **[lvm_snapshot_backup.sh](./scripts/lvm_snapshot_backup.sh):** Gestão de Rollback via Snapshot LVM.
* **[network_backup_manager.sh](./scripts/network_backup_manager.sh):** Backup de configurações de rede.
* **[raid_integrity_check.sh](./scripts/raid_integrity_check.sh):** Auditoria proativa de discos falhos.

## Lab Setup (Autenticidade Garantida)
* **Ambiente:** Terminal `gabriel@atlas` (Hostname atualizado de `rockygab` durante a configuração dos serviços core).
* **Sessão:** ![Sessão](./docs/assets/readme-structure-backbone-v2.png)
