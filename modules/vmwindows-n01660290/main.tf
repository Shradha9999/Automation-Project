resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  resource_group_name          = var.windows_rg_name
  location                     = var.windows_rg_location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_public_ip" "windows_pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  location            = var.windows_rg_location
  resource_group_name = var.windows_rg_name
  allocation_method   = "Static"
  domain_name_label   = each.key

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_network_interface" "windows_nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.windows_rg_location
  resource_group_name = var.windows_rg_name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet2_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
  }

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each            = var.windows_name
  name                = each.key
  computer_name       = each.key
  location            = var.windows_rg_location
  resource_group_name = var.windows_rg_name
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  size                  = each.value
  admin_username        = var.admin_username
  admin_password        = var.admin_password

  os_disk {
    name                 = each.key
    caching              = var.win_disk_caching
    storage_account_type = var.win_storage_account_type
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
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

resource "azurerm_virtual_machine_extension" "antimalware" {
  for_each           = var.windows_name
  name               = "IaaSAntimalware"
  virtual_machine_id = azurerm_windows_virtual_machine.windows_vm[each.key].id
  publisher          = "Microsoft.Azure.Security"
  type               = "IaaSAntimalware"
  type_handler_version = "1.3"

  settings = <<SETTINGS
    {
        "AntimalwareEnabled": true,
        "Exclusions": {
            "Extensions": ".log;.ldf",
            "Paths": "D:\\IISlogs;D:\\CustomFolder",
            "Processes": "mssence.svc"
        },
        "RealtimeProtectionEnabled": true,
        "ScheduledScanSettings": {
            "isEnabled": true,
            "scanType": "Quick",
            "day": "7",
            "time": "120"
        }
    }
  SETTINGS

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

