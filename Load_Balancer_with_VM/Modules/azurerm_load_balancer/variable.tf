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

variable "backend_address_pool_name" {
  description = "The name of the backend address pool"
  type        = string
  default     = "lb-backend-pool-001"  
}

variable "lb_probe_name" {
  description = "The name of the load balancer probe"
  type        = string
  default     = "tcp-probe-001" 
}

variable "lb_rule_name" {
  description = "The name of the load balancer rule"
  type        = string
  default     = "http-rule-001"  
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration"
  type        = string
  default     = "PublicFrontEnd"  
}

# variable "probe_id" {
#   description = "The ID of the load balancer probe"
#   type        = string  
# }




