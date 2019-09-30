output "private_ip" {
  description = "The private ip addresses allocated for the vm."
  value       = "${azurerm_network_interface.nic.private_ip_address}"
}

output "fqdn" {
  description = "The fqdn allocated for the vm."
  value       = "${azurerm_public_ip.ip.fqdn}"
}

output "vm_name" {
  description = "The virtual machine name."
  value       = "${azurerm_virtual_machine.vm.name}"
}

output "location" {
description = "The location where the resource group is created"
  value = azurerm_resource_group.rg.location
}

output "resource_group" {
description = "The resource group name."
  value = azurerm_resource_group.rg.name
}
