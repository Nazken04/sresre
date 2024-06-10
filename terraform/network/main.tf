resource "azurerm_virtual_network" "main" {
  name                = "shuup-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "app" {
  name                 = "app-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "main" {
  name                = "shuup-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "app_subnet_id" {
  description = "The ID of the app subnet"
  value       = azurerm_subnet.app.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.main.id
}
