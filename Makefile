.SILENT:

install:
	ansible-galaxy collection install community.general

run-all:
	ansible-playbook -i inventory main.yml

dowload-images:
	ansible-playbook -i inventory playbooks/main.yml --tags dowload_img

deploy-vm:
	ansible-playbook -i inventory playbooks/main.yml --tags deploy_vm

pve-config:
	ansible-playbook -i inventory playbooks/main.yml --tags pve_config