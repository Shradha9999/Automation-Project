output "virtual_network_info" {
  description = "Information about the provisioned virtual network"
  value       = {
    name          = azurerm_virtual_network.vnet.name
    address_space = azurerm_virtual_network.vnet.address_space
  }
}

output "subnet_info" {
  description = "Information about the provisioned subnet"
  value       = {
    subnet1_name    = azurerm_subnet.subnet1.name
    subnet1_address = azurerm_subnet.subnet1.address_prefixes
  }
}

output "network_security_group_name" {
  description = "Name of the provisioned network security group"
  value       = azurerm_network_security_group.nsg.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet1.id
}
