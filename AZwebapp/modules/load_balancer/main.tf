resource "azurerm_lb" "project2_lb" {
  name                = "project2-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "project2-frontend-config"
    public_ip_address_id = var.public_ip_id
  }
}

resource "azurerm_lb_backend_address_pool" "project2_lb_backend_pool" {
  name                = var.load_balancer_backend_pool_name
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.project2_lb.id
}

resource "azurerm_lb_probe" "project2_lb_probe" {
  name                = "project2-probe"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.project2_lb.id
  protocol            = "Tcp"
  port                = 80
}

resource "azurerm_lb_rule" "project2_lb_rule" {
  name                         = "project2-lb-rule"
  resource_group_name          = var.resource_group_name
  loadbalancer_id              = azurerm_lb.project2_lb.id
  protocol                     = "Tcp"
  frontend_port                = 80
  backend_port                 = 80
  frontend_ip_configuration_name = azurerm_lb.project2_lb.frontend_ip_configuration[0].name
  backend_address_pool_id      = azurerm_lb_backend_address_pool.project2_lb_backend_pool.id
  probe_id                     = azurerm_lb_probe.project2_lb_probe.id
}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.project2_lb_backend_pool.id
}