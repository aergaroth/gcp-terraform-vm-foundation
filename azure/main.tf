module "network" {
  source = "./modules/network"

  name                = "dev"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location

  vnet_cidr   = "10.30.0.0/16"
  subnet_cidr = "10.30.1.0/24"
}

module "iam_vm_login" {
  source       = "./modules/iam-vm-login"
  scope_id     = azurerm_resource_group.this.id
  principal_id = var.admin_object_id
}
