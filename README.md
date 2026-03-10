# Repo 4: Backbone Infrastructure & Networking 🛡️

Repositório dedicado à construção e administração de infraestrutura Linux avançada. Este laboratório documenta a implementação de serviços críticos, escaláveis e resilientes utilizando **Rocky Linux 9 (Enterprise Ready)** e **Ubuntu Server (Nativo)**.

### Status e Validação Real
* **Status:** 🟢 Laboratório em evolução ativa (Atualizado em 10/03/2026).
* **Ambiente:** Terminal `rockygab` (Autenticidade garantida em tempo real).
* **Evidência de Sessão:** [[Clique aqui para ver o CAT deste README direto no terminal]](./docs/assets/readme-structure-backbone-v1.png)

---

### 📂 Módulos de Implementação e Casos de Uso

#### 1. Gestão de Endereçamento Dinâmico (DHCP Server)
Implementação de um servidor DHCP autoritativo para gestão centralizada de IPs na rede local, evitando conflitos e garantindo persistência.
* **Problema:** Necessidade de automatizar a entrega de IPs em uma rede segmentada, mantendo o controle sobre dispositivos críticos.
* **Solução:** Configuração do `dhcpd` com escopo definido (`192.168.1.150` - `192.168.1.180`) e validação rigorosa de sintaxe antes do deploy.
* **Evidências:** * [Definição do Escopo e Parâmetros de Rede](./docs/assets/01-atlas-dhcp-config-definition.png)
    * [Validação de Sintaxe e Serviço Operacional (Active/Running)](./docs/assets/02-atlas-dhcp-validation-and-status.png)

#### 2. LVM e Escalabilidade de Armazenamento (Hot-Resize)
Simulação de cenário crítico de esgotamento de disco em ambiente de produção.
* **Problema:** Volume `lv_backups` atingiu 100% de ocupação (1.00 GiB).
* **Solução:** Expansão dinâmica via `lvextend` e redimensionamento online de metadados XFS no Rocky Linux.
* **Evidências:** * [Ver metadados do XFS](./docs/assets/xfs-growfs-success-metadata-lv-backups.png) 
    * [Verificação final df -h](./docs/assets/df-h-final-verification-lv-backups-1.1G.png)

#### 3. Troubleshooting de Kernel e Hardware
Registro de tratamento de bloqueios de dispositivo e identificação de metadados durante o particionamento.
* **Evidência Técnica:** [Ver alerta do fdisk](./docs/assets/fdisk-warning-disk-in-use-sdc.png)

---

### 🗺️ Roadmap de Evolução Técnica (Checklist de Carreira)

#### 🧱 Camada de Dados e Redundância
- [x] LVM2: Gerenciamento de PV, VG e LV.
- [x] Expansão online de File Systems (XFS).
- [ ] **RAID 1 (Espelhamento):** Configuração de redundância física.
- [ ] **OpenZFS:** Implementação de sistemas de arquivos avançados.

#### 🌐 Conectividade e Redes Enterprise
- [x] Gestão de rede via CLI (`nmcli` / `nmtui`).
- [x] Configuração de IP Estático e Hostnames.
- [x] Troubleshooting de rede (`MTR`, `fping`).
- [x] **DHCP Server:** Automação de endereçamento.

#### ⚙️ Serviços e Boot do Sistema
- [ ] **DNS Master/Slave (BIND9):** Resolução de nomes (Iniciando Seção 21).
- [ ] **FTP Server:** Transferência segura de arquivos.
- [ ] **GRUB:** Personalização e segurança no bootloader.

---

### 🛠️ Lab Setup (Setup Profissional)
* **Terminal:** `rockygab` (Garante a autenticidade das evidências).
* **S.O.:** Rocky Linux 9 (RHEL Family) e Ubuntu Server (Nativo).
* **Hypervisor:** Oracle VM VirtualBox.
