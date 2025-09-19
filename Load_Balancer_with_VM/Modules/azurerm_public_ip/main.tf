resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  domain_name_label   = lower(replace(var.public_ip_name, "_", "-"))
  sku                 = "Standard"
}
