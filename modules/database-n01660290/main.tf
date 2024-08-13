resource "azurerm_postgresql_server" "postgresql" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name            = "B_Gen5_1" 
  storage_mb          = 5120        
  backup_retention_days = 7
  version             = "11"        

  administrator_login = var.administrator_login
  administrator_login_password = var.administrator_login_password
  ssl_enforcement_enabled = true 

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }

}










