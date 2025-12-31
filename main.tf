module "network" {
  source = "./modules/network"
  az     = var.aws_az
}

module "iam" {
  source = "./modules/iam"
}

module "compute" {
  source = "./modules/compute"

  instances = var.instances
  aws_az    = var.aws_az

  subnet_id             = module.network.subnet_id
  security_group_id     = module.network.security_group_id
  instance_profile_name = module.iam.instance_profile_name
}
