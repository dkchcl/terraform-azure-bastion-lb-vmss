resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc1" {
  network_interface_id      = data.azurerm_network_interface.nic1.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc2" {
  network_interface_id      = data.azurerm_network_interface.nic2.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "sub_nsg_assoc" {
  subnet_id                 = data.azurerm_subnet.subnet.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}








