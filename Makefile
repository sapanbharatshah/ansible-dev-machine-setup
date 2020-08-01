deps:
	ansible-galaxy role install --roles-path=./roles --role-file=./galaxy.yml

playbook:
	ansible-playbook -K playbook.yml
