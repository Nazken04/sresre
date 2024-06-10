output "prometheus_url" {
  description = "The URL for accessing Prometheus"
  value       = azurerm_container_instance.prometheus.fqdn
}

output "grafana_url" {
  description = "The URL for accessing Grafana"
  value       = azurerm_container_instance.grafana.fqdn
}
