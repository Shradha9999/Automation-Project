resource "azurerm_managed_disk" "data_disk" {
  count               = 4
  name                = "${var.disk_name_prefix}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group
  storage_account_type = var.data_disk_attr["data_disk_type"]
  create_option       = var.data_disk_attr["data_disk_create_option"]
  disk_size_gb        = var.data_disk_attr["data_disk_size"]
  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {
  count              = 4
  virtual_machine_id = var.vm_ids[count.index]
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  lun                = count.index
  caching            = var.data_disk_attr["data_disk_caching"]
}

