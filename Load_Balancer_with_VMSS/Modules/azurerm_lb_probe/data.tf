data "azurerm_lb" "lb" {
  name                = var.lb_name
  resource_group_name = var.rg_name
}