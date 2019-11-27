resource "azurerm_resource_group" "r_group" {
    name = terraform.workspace
    location = "uksouth"
}

