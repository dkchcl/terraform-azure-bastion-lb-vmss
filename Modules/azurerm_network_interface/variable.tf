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

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "snet-vmss"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet-vmss"
}

variable "nic_name" {
  description = "The name of the network interface"
  type        = string
  default     = "nic-vmss"
}

