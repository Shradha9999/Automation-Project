resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}
