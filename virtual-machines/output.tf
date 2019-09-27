output "private_ip" {
  description = "The private ip addresses allocated for the vm."
  value       = "${azurerm_network_interface.networkinterface.private_ip_address}"
}

output "public_ip_address" {
  description = "The actual ip address allocated for the vm."
  value       = "${azurerm_public_ip.ip.ip_address}"
}

output "fqdn" {
  description = "The fqdn allocated for the vm."
  value       = "${azurerm_public_ip.ip.fqdn}"
}
