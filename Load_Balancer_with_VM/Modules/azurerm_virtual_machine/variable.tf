variable "rg_name" {
  description = "The name of the resource group"
  type        = string 
}

variable "location" {
  description = "The location of the resource group"
  type        = string 
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string 
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string  
}

variable "admin_username" {
  description = "The admin username of the virtual machine"
  type        = string  
}

variable "admin_password" {
  description = "The admin password of the virtual machine"
  type        = string  
}

variable "nic_name" {
  description = "The name of the network interface"
  type        = string    
}

variable "os_disk_caching" {
  description = "The caching of the OS disk"
  type        = string  
}

variable "os_disk_storage_account_type" {
  description = "The storage account type of the OS disk"
  type        = string  
}

variable "image_publisher" {
  description = "The publisher of the image"
  type        = string  
}

variable "image_offer" {
  description = "The offer of the image"
  type        = string  
}

variable "image_sku" {
  description = "The SKU of the image"
  type        = string  
}

variable "image_version" {
  description = "The version of the image"
  type        = string  
}

