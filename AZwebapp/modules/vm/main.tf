resource "azurerm_linux_virtual_machine_scale_set" "project2_vmss" {
  name                = "project2-vmss"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard_DS1_v2"
  instances           = 2
  admin_username      = "adminuser"
  admin_password      = var.vm_admin_password

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "project2-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      subnet_id = var.subnet_id
      primary   = true
      load_balancer_backend_address_pool_ids = [var.backend_pool_id]
    }
  }

  upgrade_policy_mode = "Manual"

  tags = {
    environment = "project2"
  }
}

output "id" {
  value = azurerm_linux_virtual_machine_scale_set.project2_vmss.id
}