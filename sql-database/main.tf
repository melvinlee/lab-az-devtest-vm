provider "azurerm" {
  # subscription_id = "${var.subscription_id}"    # tenant_id       = "${var.tenant_id}"    # client_id = "${var.client_id}"  # client_secret = "${var.client_secret}"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"
}

#an attempt to keep the mysqlname unique
resource "random_integer" "random_int" {
  min = 1000
  max = 9999
}

resource "azurerm_sql_server" "server" {
  name                         = "sqlserver-${random_integer.random_int.result}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  version                      = "12.0"
  location                     = "${azurerm_resource_group.rg.location}"
  administrator_login          = "${var.admin_login}"
  administrator_login_password = "${var.admin_password}"

  tags {
    environment = "${var.environment}"
  }
}

resource "azurerm_sql_database" "database" {
  name                             = "${var.database_name}"
  resource_group_name              = "${azurerm_resource_group.rg.name}"
  location                         = "${azurerm_resource_group.rg.location}"
  server_name                      = "${azurerm_sql_server.server.name}"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                      = "Default"
  requested_service_objective_name = "Basic"

  tags {
    environment = "${var.environment}"
  }
}

resource "azurerm_sql_firewall_rule" "firewall" {
  name                = "${azurerm_sql_server.server.name}-firewall"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  server_name         = "${azurerm_sql_server.server.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
