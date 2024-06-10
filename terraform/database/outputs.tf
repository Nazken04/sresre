output "connection_string" {
  description = "The connection string for the database"
  value       = "postgresql://${azurerm_postgresql_server.main.administrator_login}:${azurerm_postgresql_server.main.administrator_login_password}@${azurerm_postgresql_server.main.fqdn}/${azurerm_postgresql_database.main.name}?sslmode=require"
}
