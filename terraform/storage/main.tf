resource "azurerm_storage_account" "main" {
  name                     = "shuupstorageacct"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "prometheus" {
  name                 = "prometheus"
  storage_account_name = azurerm_storage_account.main.name
  quota                = 5
}

resource "azurerm_storage_share" "grafana" {
  name                 = "grafana"
  storage_account_name = azurerm_storage_account.main.name
  quota                = 5
}

output "account_name" {
  description = "The name of the Azure storage account"
  value       = azurerm_storage_account.main.name
}
