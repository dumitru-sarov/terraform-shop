
terraform {
  backend "azurerm" {
    storage_account_name  = "${var.storage_account_name}"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
	version = "=1.30.1"
}

module "config" {
  source = "./modules/config"
  resource_group = azurerm_resource_group.r_group
  virtual_network = azurerm_virtual_network.v_net
}