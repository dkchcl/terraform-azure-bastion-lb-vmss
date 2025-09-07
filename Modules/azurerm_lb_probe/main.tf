resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = data.azurerm_lb.lb.id
  name            = var.lb_probe_name
  protocol        = "Http"
  request_path    = "/"
  port            = 80
  
}