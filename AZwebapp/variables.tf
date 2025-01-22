variable "location" {
  description = "The location of the resources"
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "project2-resources"
}

variable "public_ip_id" {
  description = "The ID of the public IP address for the load balancer"
}

variable "tenant_id" {
  description = "The tenant ID for the Key Vault"
}

variable "object_id" {
  description = "The object ID for the Key Vault access policy"
}

variable "load_balancer_backend_pool_name" {
  description = "The name of the load balancer backend address pool"
  default     = "project2-backend-pool"
}

variable "subnet_id" {
  description = "The subnet ID for the VM scale set"
}

variable "backend_pool_id" {
  description = "The backend pool ID for the load balancer"
}

variable "sql_admin_password" {
  description = "The password for the SQL Server administrator"
  sensitive   = true
}

variable "vm_admin_password" {
  description = "The password for the VM Scale Set administrator"
  sensitive   = true
}