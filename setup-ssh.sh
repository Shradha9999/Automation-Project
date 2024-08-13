#!/bin/bash

# Debug DNS resolution
echo "Resolving DNS for VMs..."
nslookup n01660290-u-vm1.canadacentral.cloudapp.azure.com
nslookup n01660290-u-vm2.canadacentral.cloudapp.azure.com
nslookup n01660290-u-vm3.canadacentral.cloudapp.azure.com

# Remove old host keys
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "n01660290-u-vm1.canadacentral.cloudapp.azure.com" || true
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "n01660290-u-vm2.canadacentral.cloudapp.azure.com" || true
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "n01660290-u-vm3.canadacentral.cloudapp.azure.com" || true

# Add new host keys
ssh-keyscan -H n01660290-u-vm1.canadacentral.cloudapp.azure.com >> $HOME/.ssh/known_hosts
ssh-keyscan -H n01660290-u-vm2.canadacentral.cloudapp.azure.com >> $HOME/.ssh/known_hosts
ssh-keyscan -H n01660290-u-vm3.canadacentral.cloudapp.azure.com >> $HOME/.ssh/known_hosts

# Check if the playbook file exists
if [ ! -f /home/N01660290/Final-Project-N01660290/ansible/playbook.yml ]; then
  echo "Playbook not found!"
  exit 1
fi

# Run Ansible playbook
ansible-playbook -i /home/N01660290/Final-Project-N01660290/ansible/hosts /home/N01660290/Final-Project-N01660290/ansible/playbook.yml
