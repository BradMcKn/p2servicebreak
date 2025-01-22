resource "azurerm_sql_server" "project2_sql_server" {
  name                         = "project2sqlserver"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = var.sql_admin_password

  tags = {
    environment = "project2"
  }
}

output "id" {
  value = azurerm_sql_server.project2_sql_server.id
}