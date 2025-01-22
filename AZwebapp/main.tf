terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./modules/resource_group"
}

module "network" {
  source              = "./modules/network"
  resource_group_name = module.resource_group.name
}

module "key_vault" {
  source              = "./modules/key_vault"
  resource_group_name = module.resource_group.name
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = module.resource_group.name
}

module "public_ip" {
  source              = "./modules/pip"
  resource_group_name = module.resource_group.name
}

module "sql_server" {
  source              = "./modules/database"
  resource_group_name = module.resource_group.name
}

module "security_group" {
  source              = "./modules/security_group"
  resource_group_name = module.resource_group.name
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  resource_group_name = module.resource_group.name
  public_ip_id        = module.public_ip.id
}

module "vm" {
  source                      = "./modules/vm"
  resource_group_name         = module.resource_group.name
  subnet_id                   = module.network.subnet_id
  backend_pool_id             = module.load_balancer.backend_pool_id
  network_security_group_id   = module.security_group.id
}

output "resource_group_name" {
  value = module.resource_group.name
}

output "virtual_network_id" {
  value = module.network.subnet_id
}

output "key_vault_id" {
  value = module.key_vault.id
}

output "storage_account_id" {
  value = module.storage.id
}

output "public_ip_id" {
  value = module.public_ip.id
}

output "sql_server_id" {
  value = module.sql_server.id
}

output "nsg_id" {
  value = module.security_group.id
}

output "vmss_id" {
  value = module.vm.id
}

output "backend_address_pool_id" {
  value = module.load_balancer.backend_pool_id
}