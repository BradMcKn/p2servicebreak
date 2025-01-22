terraform {
  backend "azurerm" {
    resource_group_name   = "project2-resources"
    storage_account_name  = "project2storageacct"
    container_name        = "p2container"
    key                   = "p2servicebreak/terraform.tfstate"
  }
}