module "network" {
  source = "./modules/network"
}

module "compute" {
  source            = "./modules/compute"
  security_group_id = [module.network.security_group_id]
  subnet_id         = module.network.subnet_id
}