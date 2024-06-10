output "account_name" {
  description = "The name of the Azure storage account"
  value       = azurerm_storage_account.main.name
}
