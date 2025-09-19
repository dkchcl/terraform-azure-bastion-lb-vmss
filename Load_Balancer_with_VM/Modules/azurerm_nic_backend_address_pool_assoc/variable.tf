variable "rg_name" {
  description = "The name of the resource group"
  type        = string  
}

variable "nic_name1" {
  description = "The name of the network interface"
  type        = string 
}

variable "nic_name2" {
  description = "The name of the network interface"
  type        = string 
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

variable "ip_configuration_name" {}


