output "name" {
  description = "The name of the lab"
  value       = var.name
}

output "subnet_id" {
  description = "The subnet id"
  value       = azurerm_subnet.subnet.id
}

output "location" {
  description = "The location where the resource group is created"
  value       = azurerm_resource_group.rg.location
}

output "resource_group" {
  description = "The resource group name"
  value       = azurerm_resource_group.rg.name
}

output "tags" {
  description = "Map of tags"
  value       = local.tags
}



