output "vm_public_ip" {
  description = "The public IP address of the Shuup VM"
  value       = azurerm_public_ip.main.ip_address
}

output "vm_ids" {
  description = "The IDs of the Shuup VMs"
  value       = [azurerm_linux_virtual_machine.shuup.id]
}
