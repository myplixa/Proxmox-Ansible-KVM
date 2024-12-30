# Ansible + ProxmoxVE = IaC

>This Ansible script is designed to:
>- Downloading and modifying Cloud-Init OS images (Debian/Ubuntu/AstraLinux)
>- Pre-configuration of Proxmox nodes (the necessary packages are required for the script to work)
>- Deployment of virtual machines according to specified parameters

![pic](./img/.excalidraw.png)

#### Variables for connection to Proxmox server

| Var name         | Description |
| -                | -           |
| pve_host         | IP address or domain name of the server |
| pve_user         | The user to which the token is issued |
| pve_token_id     | Token name id |
| pve_token_secret | Token secret |

#### Variables needed for basic VM configuration

| Var name          | Example       | Default | Description |
| -                 | -             | -       | -           |
| pve_node          | pve or pve-1  | null    | You need to specify the name of the proxmox node to which you want to deploy the new vm |
| vm_name           | db-node or linux-1 | Auto_Deploy_VM | The vm name that will be assigned during creation
| vm_count          | 0 .. N        | 0    | This parameter is responsible for the number of vm's to be deployed. If the value is 0, 1 vm with the specified name will be deployed, if the value is >0, a prefix will be added to the vm name. |
| vm_cpu_type       | [documentation](https://pve.proxmox.com/wiki/Manual:_cpu-models.conf) | Westmere | You can select the type of virtual processor |
| vm_sockets        | | 1 | |
| vm_core           | | 2 | |
| vm_ram            | 512 or 1024 | 2048 | Amount of allocated RAM for vm, calculated in mb |
| vm_network_bridge | vmbr0 or vm_lan | vmbr0 | Specifies the bridge name for the network adapter |
| vm_description    | | Ansible Deploy | |

#### example var file
```
# Section with configuration for connecting to the pve service
pve_host: 'xxx.xxx.xxx.xxx'
pve_user: 'user@pam'
pve_token_id: 'user_api'
pve_token_secret: 'xxxxxxx-xxxxxx-xxxxx-xxxxx-xxxxxxx'

# Section with configuration VM
pve_node: 'pve_name_node'
vm_name: 'vm_name'
vm_cpu_type: 'Westmere'
vm_sockets: '2'
vm_core: '2'
vm_ram: '2048'
vm_network_bridge: 'vmbr1'
vm_description: 'This VM Deploy use Ansible'

# Section with configuration User data for Cloud-Init configurations
vm_domain: 'local.corp'
vm_ipconfig: 'dhcp'
vm_user_name: 'user'
vm_user_pass: 'p@ssw0rd'
vm_user_ssh_key: ''

# Section with configuration internal and external Storage
ext_storage: '/mnt/pve/nfs/template/iso'
int_storage: 'local-zfs'

# Section with configuration
img_name: 'debian-11-generic-amd64.qcow2'
img_url: 'https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2'
vm_timezone: 'Europe/Moscow'
```