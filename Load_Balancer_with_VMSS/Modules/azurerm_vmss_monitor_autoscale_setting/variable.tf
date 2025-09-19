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


variable "vmss_name" {
  description = "The name of the virtual machine scale set"
  type        = string
  default     = "vmss-demo"
}