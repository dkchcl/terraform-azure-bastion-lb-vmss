variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "dkc-rg-02"
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "North Europe"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "AzureBastionSubnet"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "dkc-vnet"
}

variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
  default     = "dkc-pip-02"
}

variable "bastion_name" {
  description = "The name of the Bastion host"
  type        = string
  default     = "dkc-bastion02"
}
