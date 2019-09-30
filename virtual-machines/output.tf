output "private_ip" {
  description = "The private ip addresses allocated for the vm."
  value       = "${azurerm_network_interface.nic.private_ip_address}"
}

output "fqdn" {
  description = "The fqdn allocated for the vm."
  value       = "${azurerm_public_ip.ip.fqdn}"
}
