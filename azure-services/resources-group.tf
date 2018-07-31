##################################################################################
# RESOURCES
##################################################################################
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}-${var.resources_id}-rg"
  location = "${var.resource_group_location}"

  tags {
    source      = "terraform"
    environment = "${var.environment}"
  }
}
