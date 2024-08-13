output "datadisk_ids" {
  description = "IDs of the provisioned data disks"
  value       = [for disk in azurerm_managed_disk.data_disk : disk.id]
}

output "datadisk_names" {
  description = "Names of the provisioned data disks"
  value       = [for disk in azurerm_managed_disk.data_disk : disk.name]
}

output "datadisk_luns" {
  description = "LUNs of the attached data disks"
  value       = [for idx, _ in var.vm_ids : azurerm_virtual_machine_data_disk_attachment.data_disk_attach[idx].lun]
}

