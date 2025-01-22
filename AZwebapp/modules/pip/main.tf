resource "azurerm_public_ip" "project2_public_ip" {
  name                = "project2-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

output "id" {
  value = azurerm_public_ip.project2_public_ip.id
}