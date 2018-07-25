output "private_ip" {
  description = "private ip addresses of the vm nics"
  value       = "${azurerm_network_interface.networkinterface.private_ip_address}"
}

output "public_ip_id" {
  description = "id of the public ip address provisoned."
  value       = "${azurerm_public_ip.ip.id}"
}

output "public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = "${azurerm_public_ip.ip.ip_address}"
}
