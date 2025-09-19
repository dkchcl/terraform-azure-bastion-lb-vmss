data "azurerm_network_interface" "nic1" {
  name                = var.nic_name1
  resource_group_name = var.rg_name
}

data "azurerm_network_interface" "nic2" {
  name                = var.nic_name2
  resource_group_name = var.rg_name
}

data "azurerm_lb" "lb" {
  name                = var.lb_name
  resource_group_name = var.rg_name
}

data "azurerm_lb_backend_address_pool" "bpepool" {
  name            = var.backend_address_pool_name
  loadbalancer_id = data.azurerm_lb.lb.id
}
