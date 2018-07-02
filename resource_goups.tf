resource "azurerm_resource_group" "main" {
  name     = "${var.main_resource_group}"
  location = "${var.main_resource_group_location}"
}