variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
  default     = "lb-dev-001"
}

variable "lb_probe_name" {
  description = "The name of the load balancer probe"
  type        = string
  default     = "tcp-probe-001"
  
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string  
}