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

    # My connection 
    connection {
		type = "ssh"
		user = "${var.admin}"
		private_key = "${file("/home/user/.ssh/id_rsa")}"
		host = azurerm_public_ip.apache2.fqdn
  	}

    # Executes commands after ssh
    provisioner "remote-exec" {
        inline = [
            "sudo apt update",
            "sudo apt install -y apache2" # gets stucked if it wait for an option, -y is needed.
        ]
    }
}

