variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
  default     = "lb-vmss"
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration"
  type        = string
  default     = "PublicFrontEnd"
  
}

variable "lb_rule_name" {
  description = "The name of the load balancer rule"
  type        = string
  default     = "http-rule-001"
  
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool"
  type        = string
  default     = "lb-backend-pool-001"
  
}

variable "lb_probe_name" {
  description = "The name of the load balancer probe"
  type        = string

}

variable "probe_id" {
  description = "The ID of the load balancer probe"
  type        = string
  
}

