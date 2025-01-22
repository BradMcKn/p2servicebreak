resource "azurerm_resource_group" "project2" {
  name     = var.resource_group_name
  location = var.location
}

output "name" {
  value = azurerm_resource_group.project2.name
}