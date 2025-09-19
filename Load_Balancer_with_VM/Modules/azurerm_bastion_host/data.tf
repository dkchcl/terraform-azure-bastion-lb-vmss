data "azurerm_subnet" "subnet" {
  name                 = var.bsubnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
}

data "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = var.rg_name
}
