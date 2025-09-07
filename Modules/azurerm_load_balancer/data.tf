data "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = var.rg_name
}