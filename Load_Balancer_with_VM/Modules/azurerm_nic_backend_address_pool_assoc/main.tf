resource "azurerm_network_interface_backend_address_pool_association" "nic1_bpepool_assoc" {
  network_interface_id    = data.azurerm_network_interface.nic1.id
  ip_configuration_name   = var.ip_configuration_name # yeh confirm karna ki NIC ke andar ka naam kya hai
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.bpepool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic2_bpepool_assoc" {
  network_interface_id    = data.azurerm_network_interface.nic2.id
  ip_configuration_name   = var.ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.bpepool.id
}






