provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}

module "storage" {
  source              = "./storage"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}

module "compute" {
  source              = "./compute"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = module.network.app_subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  nsg_id              = module.network.nsg_id
}

module "database" {
  source              = "./database"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  admin_username      = var.db_admin_username
  admin_password      = var.db_admin_password
}

module "monitoring" {
  source               = "./monitoring"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  storage_account_name = module.storage.account_name
}

module "load_balancer" {
  source              = "./load_balancer"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  backend_pool_id     = azurerm_lb_backend_address_pool.backend.id
}
