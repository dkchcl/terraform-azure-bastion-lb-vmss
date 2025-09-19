resource "azurerm_network_interface" "nic1" {
  name                = var.nic_name1
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = data.azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = var.nic_name2
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = data.azurerm_public_ip.pip.id
  }
}

