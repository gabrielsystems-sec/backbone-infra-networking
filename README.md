# Repo 4: Backbone Infrastructure & Networking 🛡️

Repositório dedicado à construção e administração de infraestrutura Linux avançada. Este laboratório documenta a implementação de serviços críticos, escaláveis e resilientes utilizando **Rocky Linux 9 (Enterprise Ready)** e **Ubuntu Server**.

### Status e Validação Real
* **Status:** ✅ Módulos de Infraestrutura e Hardening Concluídos (Versão 1.0).
* **Ambiente:** Terminal `rockygab` (Autenticidade garantida via evidências dinâmicas).
* **Evidência de Sessão:** [[Clique aqui para ver o CAT deste README direto no terminal]](./docs/assets/readme-structure-backbone-v2.png)

---

### 📂 Módulos de Implementação e Defesa (Blue Team Focus)

#### 1. Gestão de Endereçamento Dinâmico (DHCP Server)
Implementação de um servidor DHCP autoritativo para gestão centralizada de rede local.
* **Foco em Segurança:** Controle de escopo para evitar esgotamento de IPs e garantia de persistência para dispositivos de monitoramento.
* **Evidências:** * [Definição do Escopo e Parâmetros de Rede](./docs/assets/01-atlas-dhcp-config-definition.png)
    * [Validação de Sintaxe e Serviço Operacional](./docs/assets/02-atlas-dhcp-validation-and-status.png)

#### 2. Armazenamento Resiliente e Alta Disponibilidade (RAID 1 & LVM)
Implementação do pilar de **Disponibilidade (CIA Triad)** através de redundância de hardware e gestão de volumes lógicos.
* **Cenário RAID 1:** Configuração de espelhamento via software (`mdadm`) com simulação real de falha de disco e reconstrução (rebuild) sem downtime.
* **Cenário LVM:** Expansão dinâmica de volumes (`lvextend`) em resposta a alertas de ocupação crítica no `lv_backups`.
* **Evidências Técnicas:**
    * [Status de Saúde do RAID 1 (Active Sync)](./docs/assets/mdadm-raid1-active-detail.png)
    * [Simulação de Falha e Processo de Rebuild/Recovery](./docs/assets/mdadm-raid1-recovery-rebuild.png)
    * [Expansão de File System Online (XFS Growfs)](./docs/assets/xfs-growfs-success-metadata-lv-backups.png)

#### 3. Hardening de Bootloader (GRUB Security)
Proteção da camada pré-SO para impedir acessos físicos não autorizados e ataques de escalonamento de privilégios via modo de edição do kernel.
* **Implementação:** Proteção do GRUB com autenticação obrigatória utilizando hash criptográfico **PBKDF2**.
* **Evidências:**
    * [Geração de Hash Criptográfico para Usuário Admin](./docs/assets/grub-security-config-pbkdf2.png)
    * [Update de Configuração em Ambiente UEFI (Rocky Linux)](./docs/assets/grub-mkconfig-uefi-update.png)

> ⚠️ **Nota de Hardening:** As chaves (hashes) exibidas nas capturas de tela do GRUB foram geradas para fins estritamente didáticos. Em um ambiente de produção, tais segredos jamais seriam expostos, seguindo as diretrizes de Gestão de Ativos.

---

### 🗺️ Roadmap de Evolução Técnica (Concluído)

- [x] **LVM2:** Provisionamento e Hot-Resize de volumes.
- [x] **RAID 1 (Mirroring):** Resiliência contra falhas de hardware.
- [x] **DHCP & Networking:** Automação de infraestrutura de rede.
- [x] **GRUB Hardening:** Segurança física e controle de boot.
- [x] **Troubleshooting de Kernel:** Tratamento de bloqueios e identificação de metadados (`fdisk/lsblk`).

---

### 🛠️ Lab Setup (Enterprise Standards)
* **S.O. Primário:** Rocky Linux 9 (RHEL Family - Estabilidade Corporativa).
* **Hypervisor:** Oracle VM VirtualBox.
* **Metodologia:** Documentação contínua de erros e soluções (Troubleshooting-first).

---
