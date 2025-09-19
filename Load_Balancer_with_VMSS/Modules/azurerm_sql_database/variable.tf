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

variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
  default     = "sqlserver-vmss"
  
}

variable "sql_database_name" {
  description = "The name of the SQL database"
  type        = string
  default     = "sqldatabase-vmss"
}
