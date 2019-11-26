resource "azurerm_virtual_network" "v_net" {
    name = "${var.prefix}-network"
    address_space = ["10.0.0.0/16"]
    location = "${var.resource_group.location}"
    resource_group_name = "${var.resource_group.name}"
}

resource "azurerm_subnet" "front_net" {
    name = "front-net"
    resource_group_name = "${var.resource_group.name}"
    virtual_network_name = "${azurerm_virtual_network.v_net.name}"
    address_prefix = "10.0.1.0/24"
}

resource "azurerm_subnet" "back_net" {
    name = "back-net"
    resource_group_name = "${var.resource_group.name}"
    virtual_network_name = "${azurerm_virtual_network.v_net.name}"
    address_prefix = "10.0.2.0/24"
}

resource "azurerm_subnet" "manager" {
    name = "manager"
    resource_group_name = "${var.resource_group.name}"
    virtual_network_name = "${azurerm_virtual_network.v_net.name}"
    address_prefix = "10.0.3.0/24"
}
