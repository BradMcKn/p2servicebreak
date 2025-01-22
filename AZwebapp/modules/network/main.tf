resource "azurerm_virtual_network" "stagep2" {
  name                = "stagep2"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    environment = "staging"
    project     = "project2"
  }
}

resource "azurerm_subnet" "stagep2_subnet" {
  name                 = "stagep2-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.stagep2.name
  address_prefixes     = ["10.0.1.0/24"]
}

output "subnet_id" {
  value = azurerm_subnet.stagep2_subnet.id
}