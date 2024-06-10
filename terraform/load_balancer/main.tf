resource "azurerm_lb" "main" {
  name                = "shuup-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.main.id
  }

  backend_address_pool {
    name = "backend-pool"
  }
}

resource "azurerm_public_ip" "main" {
  name                = "shuup-lb-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb_backend_address_pool" "backend" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.main.id
  name                = "backend-pool"
}

resource "azurerm_lb_rule" "http" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.main.id
  name                = "http-rule"
  protocol            = "Tcp"
  frontend_port       = 80
  backend_port        = 80
  frontend_ip_configuration {
    name = azurerm_lb.main.frontend_ip_configuration.0.name
  }
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend.id
}
