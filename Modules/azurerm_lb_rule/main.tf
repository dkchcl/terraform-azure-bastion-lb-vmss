resource "azurerm_lb_rule" "http_rule" {
  
  loadbalancer_id                = data.azurerm_lb.lb.id
  name                           = var.lb_rule_name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  backend_address_pool_ids       = [data.azurerm_lb_backend_address_pool.bpepool.id]
  probe_id                       = var.probe_id
}

