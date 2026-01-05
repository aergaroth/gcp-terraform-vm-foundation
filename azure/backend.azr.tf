terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateazrfoundation"
    container_name       = "terraform"
    key                  = "env/dev/terraform.tfstate"
  }
}

