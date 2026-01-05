resource "azurerm_resource_group" "this" {
  name     = "rg-${var.project}-${var.environment}"
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.this.name
  name                = var.name
  location            = var.location
  vnet_cidr           = var.vnet_cidr
  subnet_cidr         = var.subnet_cidr
}

module "iam_vm_login" {
  source        = "./modules/iam-vm-login"
  scope_id      = azurerm_resource_group.this.id
  principal_ids = var.admin_object_ids
}
