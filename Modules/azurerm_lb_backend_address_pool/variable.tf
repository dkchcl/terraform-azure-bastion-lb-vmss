variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-vmss"
  
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
  default     = "lb-vmss"
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool"
  type        = string
  default     = "lb-backend-pool-001"
  
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "West Europe"
}