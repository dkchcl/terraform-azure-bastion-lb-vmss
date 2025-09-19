variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "West Europe"
}


variable "vmss_name" {
  description = "The name of the virtual machine scale set"
  type        = string
  default     = "vmss-demo"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet-vmss"
  
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "subnet-vmss"
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machines"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machines"
  type        = string 
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool"
  type        = string 
}

variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
}



