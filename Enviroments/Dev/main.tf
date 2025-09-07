module "rg" {
  source   = "../../Modules/azurerm_resource_group"
  rg_name  = "dev-rg"
  location = "EastUs"
}

module "vnet" {
  depends_on           = [module.rg]
  source               = "../../Modules/azurerm_virtual_network"
  rg_name              = "dev-rg"
  location             = "EastUs"
  virtual_network_name = "dev-vnet"
  address_space        = ["10.0.0.0/16"]
}

module "subnet1" {
  depends_on           = [module.vnet]
  source               = "../../Modules/azurerm_subnet"
  rg_name              = "dev-rg"
  location             = "EastUs"
  virtual_network_name = "dev-vnet"
  subnet_name          = "dev-snet-vmss"
  address_prefixes     = ["10.0.1.0/24"]
}

module "subnet2" {
  depends_on           = [module.vnet]
  source               = "../../Modules/azurerm_subnet"
  rg_name              = "dev-rg"
  location             = "EastUs"
  virtual_network_name = "dev-vnet"
  subnet_name          = "AzureBastionSubnet"
  address_prefixes     = ["10.0.2.0/24"]
}

module "nsg" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_network_security_group"
  rg_name    = "dev-rg"
  location   = "EastUs"
  nsg_name   = "dev-nsg-vmss"
}

module "public_ip1" {
  depends_on     = [module.rg]
  source         = "../../Modules/azurerm_public_ip"
  rg_name        = module.rg.rg_name
  location       = "EastUs"
  public_ip_name = "dev-pip-lb"
}

module "public_ip2" {
  depends_on     = [module.rg]
  source         = "../../Modules/azurerm_public_ip"
  rg_name        = module.rg.rg_name
  location       = "EastUs"
  public_ip_name = "dev-pip-bastion"
}

module "bastion_host" {
  depends_on     = [module.subnet2, module.public_ip2]
  source         = "../../Modules/azurerm_bastion_host"
  rg_name        = module.rg.rg_name
  location       = "EastUs"
  subnet_name    = "AzureBastionSubnet"
  vnet_name      = module.vnet.vnet_name
  public_ip_name = "dev-pip-bastion"
  bastion_name   = "dev-bastion"
}

# module "kv" {
#   depends_on     = [module.rg]
#   source         = "../../Modules/key_vault"
#   rg_name        = "rg-dev-001"
#   location       = "EastUs"
#   key_vault_name = "kv-dev-001"  
# }

# module "kvs" {
#   depends_on          = [module.kv]
#   source              = "../../Modules/key_vault_secret"
#   rg_name             = "rg-dev-001"
#   key_vault_name      = "kv-dev-001"
#   key_vault_secret_name = "adminPassword"
#   key_vault_value     = "Password1234!"
# }

module "lb" {
  depends_on     = [module.public_ip1]
  source         = "../../Modules/azurerm_load_balancer"
  rg_name        = module.rg.rg_name
  location       = "EastUs"
  lb_name        = "dev-lb"
  public_ip_name = "dev-pip-lb"
}

module "lb_backend_address_pool" {
  depends_on                = [module.lb]
  source                    = "../../Modules/azurerm_lb_backend_address_pool"
  rg_name                   = module.rg.rg_name
  location                  = "EastUs"
  lb_name                   = "dev-lb"
  backend_address_pool_name = "dev-lb-backend-pool"

}

module "lb_probe" {
  depends_on    = [module.lb]
  source        = "../../Modules/azurerm_lb_probe"
  lb_name       = "dev-lb"
  lb_probe_name = "tcp-probe-001"
  rg_name       = module.rg.rg_name
}

module "lb_rule" {
  depends_on                     = [module.lb, module.lb_backend_address_pool, module.lb_probe]
  source                         = "../../Modules/azurerm_lb_rule"
  lb_name                        = "dev-lb"
  lb_rule_name                   = "http-rule-001"
  frontend_ip_configuration_name = "PublicFrontEnd"
  rg_name                        = module.rg.rg_name
  lb_probe_name                  = "tcp-probe-001"
  backend_address_pool_name      = "dev-lb-backend-pool"
  probe_id                       = module.lb_probe.lb_probe_id
}

module "vmss" {
  depends_on                = [module.subnet1, module.nsg, module.lb, module.lb_backend_address_pool, module.lb_rule]
  source                    = "../../Modules/azurerm_vmss"
  rg_name                   = module.rg.rg_name
  location                  = "EastUs"
  vmss_name                 = "dev-vmss-001"
  admin_username            = "azureuser"
  admin_password            = "Password1234!"
  virtual_network_name      = module.vnet.vnet_name
  subnet_name               = "dev-snet-vmss"
  nsg_name                  = "dev-nsg-vmss"
  lb_name                   = "dev-lb"
  backend_address_pool_name = "dev-lb-backend-pool"
}

module "monitor_autoscale" {
  depends_on = [module.vmss]
  source     = "../../Modules/azurerm_vmss_monitor_autoscale_setting"
  vmss_name  = "dev-vmss-001"
  rg_name    = module.rg.rg_name
  location   = "EastUs"

}



