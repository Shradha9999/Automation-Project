resource "azurerm_public_ip" "lb_pip" {
  count               = 1
  name                = "${var.resource_prefix}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_lb" "assignment1lb" {
  name                = "${var.resource_prefix}-lb"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip[0].id
  }

  tags = {
    Assignment     = var.assignment
    Name           = var.name
    ExpirationDate = var.expiration_date
    Environment    = var.environment
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  name            = "${var.resource_prefix}-bap"
  loadbalancer_id = azurerm_lb.assignment1lb.id
}

resource "azurerm_lb_probe" "lb_probe" {
  name            = "${var.resource_prefix}-lb-probe"
  loadbalancer_id = azurerm_lb.assignment1lb.id
  protocol        = "Tcp"
  port            = 80
}

resource "azurerm_lb_rule" "lb_rule" {
  name                            = "${var.resource_prefix}-lbr"
  loadbalancer_id                 = azurerm_lb.assignment1lb.id
  protocol                        = "Tcp"
  frontend_port                   = 80
  backend_port                    = 80
  frontend_ip_configuration_name  = "PublicIPAddress"
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.lb_backend_pool.id]
  probe_id                        = azurerm_lb_probe.lb_probe.id
}
