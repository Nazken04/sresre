variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "backend_pool_id" {
  description = "The ID of the backend pool for the load balancer"
  type        = string
}
