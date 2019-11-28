resource "azurerm_public_ip" "apache2" {
    name                         = "${terraform.workspace}-nginx-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label = "${terraform.workspace}-dumitru-sarov"
}

resource "azurerm_public_ip" "manager_ip" {
    name                         = "${terraform.workspace}-manager-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label = "${terraform.workspace}-dumitru-sarov-manager"
}