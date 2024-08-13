resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  resource_group_name          = var.linux_rg_name
  location                     = var.linux_rg_location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_public_ip" "linux_pip" {
  for_each            = var.vm_instances
  name                = "${each.key}-pip"
  location            = var.linux_rg_location
  resource_group_name = var.linux_rg_name
  allocation_method   = "Static"
  domain_name_label   = each.key

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_network_interface" "linux_nic" {
  for_each            = var.vm_instances
  name                = "${each.key}-nic"
  location            = var.linux_rg_location
  resource_group_name = var.linux_rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.key].id
  }

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each            = var.vm_instances
  name                = each.key
  computer_name       = each.key
  location            = var.linux_rg_location
  resource_group_name = var.linux_rg_name
  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]
  size                  = var.size
  admin_username        = var.admin_username
  availability_set_id   = azurerm_availability_set.linux_avs.id  

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

  os_disk {
    name                 = "${each.key}-osdisk"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_uri
  }

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each            = var.vm_instances
  name                = "NetworkWatcherAgentLinux"
  virtual_machine_id  = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher           = "Microsoft.Azure.NetworkWatcher"
  type                = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
  depends_on = [
    azurerm_linux_virtual_machine.linux_vm,  ]
  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}


resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each            = var.vm_instances
  name                = "AzureMonitorLinuxAgent"
  virtual_machine_id  = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher           = "Microsoft.Azure.Monitor"
  type                = "AzureMonitorLinuxAgent"
  type_handler_version = "1.10" 
 depends_on = [
    azurerm_linux_virtual_machine.linux_vm,
  ]
   tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }

}


resource "azurerm_network_interface_backend_address_pool_association" "linux_lb_backend_pool_association" {
  for_each                    = var.vm_instances
  network_interface_id        = azurerm_network_interface.linux_nic[each.key].id
  ip_configuration_name       = "internal"
  backend_address_pool_id     = var.lb_backend_pool_id  
}
