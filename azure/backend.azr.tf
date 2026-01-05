# Example backend configuration (for reference only).
# Terraform backends do NOT support variables by design.
# Actual values must be provided during `terraform init`.

#terraform {
#  backend "azurerm" {
#    resource_group_name  = "rg-tfstate-azure"
#    storage_account_name = "tfstateazrsebdev01"
#    container_name       = "tfstate"
#    key                  = "env/dev/terraform.tfstate"
#  }
#}

terraform {
  backend "azurerm" {}
}
