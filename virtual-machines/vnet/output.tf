output "subnet_id" {
  value = azurerm_subnet.subnet.id

  depends_on = ["azurerm_subnet.subnet"]
}
