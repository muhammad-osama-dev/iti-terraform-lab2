# main.tf (outside the network module)

module "network" {
  source = "./network"
  region = var.region
  vpc_cidr = var.vpc_cidr
  subnet_configs = var.subnet_configs
}
