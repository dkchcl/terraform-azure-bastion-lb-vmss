resource "azurerm_bastion_host" "Bastion" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
  copy_paste_enabled  = true
  file_copy_enabled   = true

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}
