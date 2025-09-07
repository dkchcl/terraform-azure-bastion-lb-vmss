variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-vmss"
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
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

variable "address_prefixes" {
  description = "The address prefixes that are used the subnet"
  type        = list(string)
}

