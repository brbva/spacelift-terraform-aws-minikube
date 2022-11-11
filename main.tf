module "network" {
  source = "./modules/network"
}

module "main-node" {
  source            = "./modules/compute"
  security_group_id = [module.network.security_group_id]
  subnet_id         = module.network.subnet_id
  node_name         = "main"
  key_name          = "main-key"
  instance_type     = "t2.micro"
}

module "bjay-node" {
  source            = "./modules/compute"
  security_group_id = [module.network.security_group_id]
  subnet_id         = module.network.subnet_id
  node_name         = "bjay"
  key_name          = "bjay-key"
  instance_type     = "t2.micro"
}