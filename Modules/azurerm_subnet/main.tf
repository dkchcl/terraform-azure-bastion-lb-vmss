resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = "${var.rg_name}-${var.location}"
  virtual_network_name = "${var.virtual_network_name}-${var.location}"
  address_prefixes     = var.address_prefixes
}
