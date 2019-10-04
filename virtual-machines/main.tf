data "terraform_remote_state" "vnet" {
  backend = "local"

  config = {
    path = "${path.module}/../vnet/terraform.tfstate"
  }
}

locals {
  location       = data.terraform_remote_state.vnet.outputs.location
  resource_group = data.terraform_remote_state.vnet.outputs.resource_group
  name           = data.terraform_remote_state.vnet.outputs.name
  uniqued_name   = "${data.terraform_remote_state.vnet.outputs.name}${random_integer.int.result}"
  tags           = data.terraform_remote_state.vnet.outputs.tags
}

resource "random_id" "id" {
  keepers = {
    name = local.name
  }
  byte_length = 6
}

resource "random_integer" "int" {
  min = 100
  max = 999
}

# Allocate a Public IP address for your Virtual Machine for remote access
resource "azurerm_public_ip" "ip" {
  name                = "${local.name}-ip"
  location            = local.location
  resource_group_name = local.resource_group
  allocation_method   = "Dynamic"
  domain_name_label   = local.uniqued_name

  tags = local.tags
}

resource "azurerm_network_interface" "nic" {
  name                      = "${local.name}${random_integer.int.result}-nic"
  location                  = local.location
  resource_group_name       = local.resource_group
  network_security_group_id = azurerm_network_security_group.nsg.id

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet_id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.ip.id
  }

  tags = local.tags

  depends_on = [azurerm_public_ip.ip]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${local.name}-nsg"
  location            = local.location
  resource_group_name = local.resource_group

  security_rule {
    name                       = "RDP"
    description                = "Allow RDP traffic"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.tags
}

resource "azurerm_storage_account" "sa" {
  name                     = "bootdiag${lower(random_id.id.hex)}"
  location                 = local.location
  resource_group_name      = local.resource_group
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

resource "azurerm_virtual_machine" "vm" {
  name                          = "${local.name}-vm"
  location                      = local.location
  resource_group_name           = local.resource_group
  network_interface_ids         = [azurerm_network_interface.nic.id]
  vm_size                       = var.vm_size
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = var.image["publisher"]
    offer     = var.image["offer"]
    sku       = var.image["sku"]
    version   = var.image["version"]
  }

  storage_os_disk {
    name              = "${local.name}-osdisk-${lower(random_id.id.hex)}"
    managed_disk_type = "Premium_LRS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  os_profile {
    computer_name  = local.name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true                      # Required VM Agent to execute Azure virtual machine extensions.
    timezone                  = "Singapore Standard Time" # Specifies the time zone of the virtual machine, the possible values are defined http://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/
  }

  boot_diagnostics {
    enabled     = var.boot_diagnostics
    storage_uri = var.boot_diagnostics == "true" ? azurerm_storage_account.sa.primary_blob_endpoint : ""
  }

  tags = local.tags

  depends_on = [azurerm_network_interface.nic]
}
