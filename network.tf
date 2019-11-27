resource "azurerm_virtual_network" "v_net" {
    name = "${terraform.workspace}-network"
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.r_group.location
    resource_group_name = azurerm_resource_group.r_group.name
}

