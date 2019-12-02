resource "azurerm_virtual_machine" "front-end" {
    name = "${var.prefix}-front-vm"
    resource_group_name = "${var.resource_group.name}"
    location = "${var.resource_group.location}"
    network_interface_ids = ["${azurerm_network_interface.front_end_nic.id}"]
    vm_size = "Standard_DS1_v2"

    storage_image_reference {
    publisher = "credativ"
    offer     = "Debian"
    sku       = "9"
    version   = "latest"
    
    }

    storage_os_disk {
    name              = "${var.prefix}-front-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    
    }

    os_profile {
    computer_name  = "${var.prefix}-front-vm"
    admin_username = "${var.admin}"
    
    }

    # Remote connection
    os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	path = "/home/${var.admin}/.ssh/authorized_keys"
	key_data = "${file("/home/user/.ssh/id_rsa.pub")}"
        }
    }
}

resource "azurerm_virtual_machine" "manager" {
    name = "${var.prefix}-manager-vm"
    resource_group_name = "${var.resource_group.name}"
    location = "${var.resource_group.location}"
    network_interface_ids = ["${azurerm_network_interface.manager_nic.id}"]
    vm_size = "Standard_DS1_v2"

    storage_image_reference {
    publisher = "credativ"
    offer     = "Debian"
    sku       = "9"
    version   = "latest"
    
    }

    storage_os_disk {
    name              = "${var.prefix}-manager-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    
    }

    os_profile {
    computer_name  = "${var.prefix}-manager-vm"
    admin_username = "${var.admin}"
    
    }

    # Remote connection
    os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	path = "/home/${var.admin}/.ssh/authorized_keys"
	key_data = "${file("/home/user/.ssh/id_rsa.pub")}"
        }
    }
}

resource "azurerm_virtual_machine" "back_vm" {
    name = "${var.prefix}-back-vm"
    resource_group_name = "${var.resource_group.name}"
    location = "${var.resource_group.location}"
    network_interface_ids = ["${azurerm_network_interface.back_nic.id}"]
    vm_size = "Standard_DS1_v2"

    storage_image_reference {
    publisher = "credativ"
    offer     = "Debian"
    sku       = "9"
    version   = "latest"
    
    }

    storage_os_disk {
    name              = "${var.prefix}-back-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    
    }

    os_profile {
    computer_name  = "${var.prefix}-back-vm"
    admin_username = "${var.admin}"
    
    }

    # Remote connection
    os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	path = "/home/${var.admin}/.ssh/authorized_keys"
	key_data = "${file("/home/user/.ssh/id_rsa.pub")}"
        }
    }
}