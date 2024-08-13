output "location" {
  description = "The name of the location"
  value       = module.resource_group.location
}
output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.resource_group_name
}


output "network_info" {
  description = "Information about the provisioned network"
  value       = module.network.virtual_network_info
}

output "subnet_info" {
  description = "Information about the provisioned subnet"
  value       = module.network.subnet_info
}

output "nsg_name" {
  description = "Name of the provisioned network security group"
  value       = module.network.network_security_group_name
}


output "log_analytics_workspace_name" {
  description = "The name of the log analytics workspace"
  value       = module.common.log_analytics_workspace_name
}

output "recovery_vault_name" {
  description = "The name of the recovery services vault"
  value       = module.common.recovery_vault_name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.common.storage_account_name
}

output "vm_hostnames" {
  description = "The hostnames of the Linux VMs"
  value       = module.vmlinux.vm_hostnames
}

output "vm_fqdns" {
  description = "The fully qualified domain names of the Linux VMs"
  value       = module.vmlinux.vm_fqdns
}

output "private_ip_addresses" {
  description = "The private IP addresses of the Linux VMs"
  value       = module.vmlinux.private_ip_addresses
}
output "public_ip_addresses" {
  description = "The public IP addresses of the Linux VMs"
  value       = module.vmlinux.public_ip_addresses
}

output "windows_vm_hostname" {
  description = "The hostname of the Windows VM"
  value       = module.vmwindows.windows_vm_hostname
}

output "windows_vm_fqdn" {
  description = "The fully qualified domain name of the Windows VM"
  value       = module.vmwindows.windows_vm_fqdn
}

output "windows_private_ip_address" {
  description = "The private IP address of the Windows VM"
  value       = module.vmwindows.windows_private_ip_address
}

output "windows_public_ip_address" {
  description = "The public IP address of the Windows VM"
  value       = module.vmwindows.windows_public_ip_address
}

output "datadisk_ids" {
  description = "The IDs of the data disks"
  value       = module.datadisks.datadisk_ids
}

output "datadisk_names" {
  description = "The names of the data disks"
  value       = module.datadisks.datadisk_names
}

output "datadisk_luns" {
  description = "The LUNs of the data disks"
  value       = module.datadisks.datadisk_luns
}

output "load_balancer_name" {
  description = "The name of the load balancer"
  value       = module.loadbalancer.lb_name
}


output "db_name" {
  value = module.database.db_server_name
}
