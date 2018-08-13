##################################################################################
# RESOURCES
##################################################################################

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "acceptanceTestSecurityGroup"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  
  subnet {
    name           = "public"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "private"
    address_prefix = "10.0.2.0/24"
       security_group = "${azurerm_network_security_group.nsg.id}"
  }

  tags {
      source = "terraform"
      env = "${var.environment}"
  }
}