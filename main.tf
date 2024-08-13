module "resource_group" {
  source              = "./modules/rgroup-n01660290"
  resource_group_name = "n01660290-RG"
  location            = "Canada Central"
}


module "network" {
  source              = "./modules/network-n01660290"
  network_rg_name     = module.resource_group.resource_group_name
  network_rg_location = module.resource_group.location
  vnet_name           = "n01660290-VNET"
  vnet_aspace         = ["10.0.0.0/16"]
  subnet1             = "n01660290-SUBNET"
  subnet1_aspace      = ["10.0.0.0/24"]
  nsg_name            = "n01651170-NSG"
}


module "common" {
  source              = "./modules/common-n01660290"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
}



module "vmlinux" {
  source                     = "./modules/vmlinux-n01660290"
  linux_rg_name              = module.resource_group.resource_group_name
  linux_rg_location          = module.resource_group.location
  subnet1_id                 = module.network.subnet_id
  boot_diagnostics_storage_uri = module.common.storage_account_primary_blob_endpoint
  vm_instances               = {
    "n01660290-u-vm1" = {}
    "n01660290-u-vm2" = {}
    "n01660290-u-vm3" = {}
  }

  lb_backend_pool_id         = module.loadbalancer.lb_backend_pool_id
}


module "vmwindows" {
  source                     = "./modules/vmwindows-n01660290"
  windows_rg_name            = module.resource_group.resource_group_name
  windows_rg_location        = module.resource_group.location
  subnet2_id                 = module.network.subnet_id
  boot_diagnostics_storage_uri = module.common.storage_account_primary_blob_endpoint
}


module "datadisks" {
  source              = "./modules/datadisk-n01660290"
  location            = module.resource_group.location 
  resource_group      = module.resource_group.resource_group_name
  disk_name_prefix    = "datadisk"
  vm_ids              = concat(module.vmwindows.windows_vm_ids, module.vmlinux.linux_vm_ids)
}



module "loadbalancer" {
  source              = "./modules/loadbalancer-n01660290"
  resource_prefix     = "n01660290"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  assignment          = "Assignment1"
  name                = "Shradha Gopi"
  expiration_date     = "2024-12-31"
  environment         = "Learning"
}


module "database" {
  source                = "./modules/database-n01660290"
  server_name           = "postgresql-server-n01660290"
  location              =  module.resource_group.location
  resource_group_name   =  module.resource_group.resource_group_name
  administrator_login   = "n01660290"
  administrator_login_password = "Siju@123"
  database_name         = "db_server_name"
 }

resource "null_resource" "setup_ssh" {
  provisioner "local-exec" {
    command = "chmod +x ./setup-ssh.sh && ./setup-ssh.sh"
  }
  depends_on = [
    module.vmlinux,
  ]
}
