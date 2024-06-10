output "vm_public_ip" {
  description = "The public IP address of the Shuup VM"
  value       = module.compute.vm_public_ip
}

output "load_balancer_public_ip" {
  description = "The public IP address of the load balancer"
  value       = azurerm_public_ip.main.ip_address
}
