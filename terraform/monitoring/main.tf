resource "azurerm_container_instance" "prometheus" {
  name                = "prometheus"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"

  container {
    name   = "prometheus"
    image  = "prom/prometheus:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 9090
      protocol = "TCP"
    }

    volume {
      name      = "prometheus-storage"
      mount_path = "/prometheus"
    }
  }

  volume {
    name = "prometheus-storage"
    azure_file {
      share_name          = azurerm_storage_share.prometheus.name
      storage_account_name = var.storage_account_name
    }
  }
}

resource "azurerm_container_instance" "grafana" {
  name                = "grafana"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"

  container {
    name   = "grafana"
    image  = "grafana/grafana:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 3000
      protocol = "TCP"
    }

    volume {
      name      = "grafana-storage"
      mount_path = "/var/lib/grafana"
    }
  }

  volume {
    name = "grafana-storage"
    azure_file {
      share_name          = azurerm_storage_share.grafana.name
      storage_account_name = var.storage_account_name
    }
  }
}
