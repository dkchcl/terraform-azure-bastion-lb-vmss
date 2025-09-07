variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-vmss"
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "West Europe"
}

variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
  default     = "pipvmssdemo"
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
  default     = "lb-vmss"
}


