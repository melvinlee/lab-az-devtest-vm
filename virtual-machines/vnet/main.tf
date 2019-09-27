
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group

  tags = var.tags_map
}

resource "azurerm_subnet" "subnet" {
  name                 = "default"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "10.0.0.0/24"
}

