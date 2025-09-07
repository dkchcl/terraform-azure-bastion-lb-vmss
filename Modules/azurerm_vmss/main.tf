resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Standard_F2"
  instances           = 1
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  upgrade_mode = "Automatic"

  network_interface {
    name    = "${var.vmss_name}-nic"
    primary = true

    ip_configuration {
      name                          = "internal"
      primary                       = true
      subnet_id                     = data.azurerm_subnet.subnet.id
      load_balancer_backend_address_pool_ids = [data.azurerm_lb_backend_address_pool.bpepool.id]
    }
     # NSG associate karna hai to:
    network_security_group_id = data.azurerm_network_security_group.nsg.id
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  # 🚀 Nginx Install script (cloud-init)
custom_data = base64encode(<<EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

cat <<EOT | sudo tee /var/www/html/index.html
<h1 style="color: #1E90FF; font-weight: bold; text-align: center;">
 🚀 Welcome to Nginx on VM Scale Set 🌍
</h1>

<h2 style="color: #FF4500; font-weight: bold; text-align: center;">
 🔥 Keep Learning, Keep Building & Keep Automating – Welcome to the DevOps World! ⚙️💻
</h2>
EOT
EOF
)

}

