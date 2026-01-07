resource "azurerm_resource_group" "this" {
  name     = "rg-${var.project}-${var.env}"
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.this.name
  name                = var.name
  location            = var.location
  vnet_cidr           = var.vnet_cidr
  subnet_cidr         = var.subnet_cidr
  bastion_subnet_cidr = var.bastion_subnet_cidr
}

module "iam_vm_login" {
  source        = "./modules/iam-vm-login"
  scope_id      = azurerm_resource_group.this.id
  principal_ids = var.admin_object_ids
}

module "compute" {
  source = "./modules/compute"

  name                = "${var.project}-${var.env}-vm"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location

  subnet_id = module.network.subnet_id
  nsg_id    = module.network.nsg_id

  bootstrap_ssh_public_key = var.bootstrap_ssh_public_key
  tags                     = var.tags
}


module "vm_login" {
  source = "./modules/iam-vm-login"

  scope_id      = module.compute.vm_id
  principal_ids = var.vm_login_principal_ids
}


module "bastion" {
  source = "./modules/bastion"

  name                = "${var.project}-${var.env}-bastion"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location

  subnet_id = module.network.bastion_subnet_id
  tags      = var.tags
}
