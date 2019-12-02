resource "azurerm_network_interface" "front_end_nic" {
  name                = "${var.prefix}-front-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.front_nsg.id


  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.front_net.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.nginx.id
  }
}

resource "azurerm_network_interface" "manager_nic" {
  name                = "${var.prefix}-manager"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.manager_nsg.id


  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     = azurerm_subnet.manager_net.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jenkins.id
  }
}

resource "azurerm_network_interface" "back_nic" {
  name                = "${var.prefix}-manager"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.back_nsg.id


  ip_configuration {
    name                          = "testconfiguration3"
    subnet_id                     = azurerm_subnet.back_net.id
    private_ip_address_allocation = "Dynamic"
  }
}

