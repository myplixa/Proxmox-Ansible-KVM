.SILENT:

install:
	ansible-galaxy collection install community.general

run-all:
	ansible-playbook -i inventory playbooks/main.yml

dowload-images:
	ansible-playbook -i inventory playbooks/main.yml --tags dowload

deploy-vm:
	ansible-playbook -i inventory playbooks/main.yml --tags deploy

pve-config:
	ansible-playbook -i inventory playbooks/main.yml --tags config
