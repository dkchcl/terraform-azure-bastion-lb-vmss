resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicFrontEnd"
    public_ip_address_id = data.azurerm_public_ip.pip.id
    
  }
}