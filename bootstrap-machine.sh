#!/bin/bash

PROJECTS_DIRECTORY="${HOME}/Projects"

bootstrap_fedora_machine() {
  sudo dnf install -y ansible git make lastpass-cli
  sudo sed -i 's/FirewallBackend=nftables/FirewallBackend=iptables/g' /etc/firewalld/firewalld.conf
  sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
  sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
  sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
  sudo systemctl restart firewalld
}

bootstrap_fedora_machine
#mkdir -p $PROJECTS_DIRECTORY
#cd $PROJECTS_DIRECTORY
#git clone https://github.com/sapanbharatshah/ansible-dev-machine-setup.git
