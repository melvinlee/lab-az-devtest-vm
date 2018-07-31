##################################################################################
# RESOURCES
##################################################################################
resource "azurerm_servicebus_namespace" "servicebus" {
  name                = "servicebus-${var.resources_id}-${random_integer.random_int.result}"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  sku                 = "standard"

  depends_on = ["azurerm_resource_group.rg"]

  tags {
    source      = "terraform"
    environment = "${var.environment}"
  }
}

resource "azurerm_servicebus_queue" "queue" {
  name                = "${var.queue_name}"
  resource_group_name = "${azurerm_servicebus_namespace.servicebus.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.servicebus.name}"

  enable_partitioning = true
}

resource "azurerm_servicebus_queue_authorization_rule" "root" {
  name                = "RootManageSharedAccessKey"
  namespace_name      = "${azurerm_servicebus_queue.queue.namespace_name}"
  queue_name          = "${azurerm_servicebus_queue.queue.name}"
  resource_group_name = "${azurerm_servicebus_namespace.servicebus.resource_group_name}"
  listen              = true
  send                = true
  manage              = true
}
