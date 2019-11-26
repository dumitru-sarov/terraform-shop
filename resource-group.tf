resource "azurerm_resource_group" "r_group" {
    name = "${var.prefix}"
    location = "uksouth"
}

