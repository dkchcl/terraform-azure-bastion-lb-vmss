variable "key_vault_secret_name" {
  description = "The name of the Key Vault secret"
  type        = string
}

variable "key_vault_value" {
  description = "The value of the Key Vault secret"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string  
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}