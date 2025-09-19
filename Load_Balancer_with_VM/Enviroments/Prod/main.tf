module "rg" {
  source   = "../../Modules/azurerm_resource_group"
  rg_name  = "rg-prod-weu-001"
  location = "West Europe"
}

module "vnet" {
  depends_on           = [module.rg]
  source               = "../../Modules/azurerm_virtual_network"
  virtual_network_name = "vnet-prod-weu-001"
  address_space        = ["10.0.0.0/16"]
  rg_name              = "rg-prod-weu-001"
  location             = "West Europe"
}

module "subnet1" {
  depends_on           = [module.vnet]
  source               = "../../Modules/azurerm_subnet"
  subnet_name          = "snet-prod-weu-001"
  virtual_network_name = "vnet-prod-weu-001"
  address_prefixes     = ["10.0.1.0/24"]
  rg_name              = "rg-prod-weu-001"
}

module "subnet2" {
  depends_on           = [module.vnet]
  source               = "../../Modules/azurerm_subnet"
  subnet_name          = "snet-prod-lb-001"
  virtual_network_name = "vnet-prod-weu-001"
  address_prefixes     = ["10.0.2.0/24"]
  rg_name              = "rg-prod-weu-001"
}

module "subnet3" {
  depends_on           = [module.vnet]
  source               = "../../Modules/azurerm_subnet"
  subnet_name          = "AzureBastionSubnet"
  virtual_network_name = "vnet-prod-weu-001"
  address_prefixes     = ["10.0.3.0/24"]
  rg_name              = "rg-prod-weu-001"
}

module "pip1" {
  depends_on     = [module.rg]
  source         = "../../Modules/azurerm_public_ip"
  public_ip_name = "bastion-pip-prod-001"
  rg_name        = "rg-prod-weu-001"
  location       = "West Europe"

}

module "pip2" {
  depends_on     = [module.rg]
  source         = "../../Modules/azurerm_public_ip"
  public_ip_name = "lb-pip-prod-001"
  rg_name        = "rg-prod-weu-001"
  location       = "West Europe"
}

module "nsg" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_network_security_group"
  nsg_name   = "nsg-prod-weu-001"
  rg_name    = "rg-prod-weu-001"
  location   = "West Europe"
}

module "nic" {
  depends_on            = [module.subnet1, module.vnet]
  source                = "../../Modules/azurerm_network_interface"
  nic_name1             = "vm-nic-prod-001"
  nic_name2             = "vm-nic-prod-002"
  rg_name               = "rg-prod-weu-001"
  location              = "West Europe"
  subnet_name           = "snet-prod-weu-001"
  vnet_name             = "vnet-prod-weu-001"
  ip_configuration_name = "vm-ip-config"
}

# module "bastion" {
#   depends_on            = [module.pip1, module.subnet3]
#   source                = "../../Modules/azurerm_bastion_host"
#   bastion_name          = "bastion-prod-weu-001"
#   rg_name               = "rg-prod-weu-001"
#   location              = "West Europe"
#   bsubnet_name          = "AzureBastionSubnet"
#   vnet_name             = "vnet-prod-weu-001"
#   pip_name              = "bastion-pip-prod-001"
#   ip_configuration_name = "bastion-ip-config"
# }

module "nic_sub_nsg_assoc" {
  depends_on  = [module.nsg, module.nic, module.subnet2, module.vnet]
  source      = "../../Modules/azurerm_nic_sub_nsg_assoc"
  rg_name     = "rg-prod-weu-001"
  nic_name1   = "vm-nic-prod-001"
  nic_name2   = "vm-nic-prod-002"
  nsg_name    = "nsg-prod-weu-001"
  vnet_name   = "vnet-prod-weu-001"
  subnet_name = "snet-prod-lb-001"
}

module "nic_bpepool_assoc" {
  depends_on                = [module.nic, module.lb]
  source                    = "../../Modules/azurerm_nic_backend_address_pool_assoc"
  rg_name                   = "rg-prod-weu-001"
  nic_name1                 = "vm-nic-prod-001"
  nic_name2                 = "vm-nic-prod-002"
  ip_configuration_name     = "vm-ip-config"
  lb_name                   = "lb-prod-weu-001"
  backend_address_pool_name = "lbbpool-prod-001"
}

module "vm1" {
  depends_on                   = [module.nic, module.nic_sub_nsg_assoc, module.subnet1, module.vnet]
  source                       = "../../Modules/azurerm_virtual_machine"
  vm_name                      = "vm1-prod-weu-001"
  rg_name                      = "rg-prod-weu-001"
  location                     = "West Europe"
  vm_size                      = "Standard_B1s"
  nic_name                     = "vm-nic-prod-001"
  admin_username               = "adminuser"
  admin_password               = "Password1234!"
  os_disk_caching              = "ReadWrite"
  os_disk_storage_account_type = "Standard_LRS"
  image_publisher              = "Canonical"
  image_offer                  = "UbuntuServer"
  image_sku                    = "18.04-LTS"
  image_version                = "latest"
}

module "vm2" {
  depends_on                   = [module.nic, module.nic_sub_nsg_assoc, module.subnet1, module.vnet]
  source                       = "../../Modules/azurerm_virtual_machine"
  vm_name                      = "vm2-prod-weu-001"
  rg_name                      = "rg-prod-weu-001"
  location                     = "West Europe"
  vm_size                      = "Standard_B1s"
  nic_name                     = "vm-nic-prod-002"
  admin_username               = "adminuser"
  admin_password               = "Password1234!"
  os_disk_caching              = "ReadWrite"
  os_disk_storage_account_type = "Standard_LRS"
  image_publisher              = "Canonical"
  image_offer                  = "UbuntuServer"
  image_sku                    = "18.04-LTS"
  image_version                = "latest"
}

module "lb" {
  depends_on                     = [module.pip2, module.subnet2, module.nic_sub_nsg_assoc, module.vm1, module.vm2]
  source                         = "../../Modules/azurerm_load_balancer"
  lb_name                        = "lb-prod-weu-001"
  backend_address_pool_name      = "lbbpool-prod-001"
  lb_probe_name                  = "lbprobe-prod-001"
  lb_rule_name                   = "lbrule-prod-001"
  frontend_ip_configuration_name = "fip-lb-prod-001"
  rg_name                        = "rg-prod-weu-001"
  location                       = "West Europe"
  public_ip_name                 = "lb-pip-prod-001"
}



