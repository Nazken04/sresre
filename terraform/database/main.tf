resource "azurerm_postgresql_server" "main" {
  name                = "shuup-db-server"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  version             = "11"
}

resource "azurerm_postgresql_database" "main" {
  name                = "shuupdb"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.main.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

output "connection_string" {
  description = "The connection string for the database"
  value       = "postgresql://${azurerm_postgresql_server.main.administrator_login}:${azurerm_postgresql_server.main.administrator_login_password}@${azurerm_postgresql_server.main.fqdn}/${azurerm_postgresql_database.main.name}?sslmode=require"
}
