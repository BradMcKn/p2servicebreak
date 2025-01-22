resource "azurerm_storage_account" "project2_storage" {
  name                     = "project2storageacct"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "project2"
  }
}

output "id" {
  value = azurerm_storage_account.project2_storage.id
}