resource "azurerm_lb_backend_address_pool" "bpepool" {
  loadbalancer_id = data.azurerm_lb.lb.id
  name            = var.backend_address_pool_name
}

resource "azurerm_lb_nat_pool" "lbnatpool" {
  resource_group_name = var.rg_name
  name                           = "ssh"
  loadbalancer_id                = data.azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50119
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicFrontEnd"
}