provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "./modules/network"

  project_id        = var.project_id
  region            = var.region
  network_name      = var.network_name
  network_cidr      = var.subnet_cidr
  subnet_name       = var.subnet_name
  subnet_cidr       = var.subnet_cidr
  allowed_ssh_cidrs = var.allowed_ssh_cidrs
}

module "iam" {
  source = "./modules/iam"

  project_id           = var.project_id
  service_account_name = var.service_account_name
}


module "compute" {
  source = "./modules/compute"

  instance_name         = var.instance_name
  machine_type          = var.machine_type
  zone                  = var.zone
  subnet                = module.network.subnet_id
  service_account_email = module.iam.service_account_email
  #  ssh_username          = var.ssh_username
  #  ssh_public_key        = var.ssh_public_key
}
