# CREATE SUBNETS - EU/NA/SA/AP
module "eu_subnet" {
  source                   = "./modules/vpcs/vpc_subnet"
  name                     = local.instances.net1.name
  project                  = var.networks.net1.project
  ip_cidr_range            = local.instances.net1.subnet
  network                  = module.vpc_networks["net1"].id
  region                   = local.instances.net1.region
  private_ip_google_access = true

  depends_on = [module.vpc_networks["net1"]]
}

module "na_subnet" {
  source                   = "./modules/vpcs/vpc_subnet"
  name                     = local.instances.net2.name
  project                  = var.networks.net2.project
  ip_cidr_range            = local.instances.net2.subnet
  network                  = module.vpc_networks["net2"].id
  region                   = local.instances.net2.region
  private_ip_google_access = true

  depends_on = [module.vpc_networks["net2"]]
}

module "sa_subnet" {
  source                   = "./modules/vpcs/vpc_subnet"
  name                     = local.instances.net3.name
  project                  = var.networks.net3.project
  ip_cidr_range            = local.instances.net3.subnet
  network                  = module.vpc_networks["net3"].id
  region                   = local.instances.net3.region
  private_ip_google_access = true

  depends_on = [module.vpc_networks["net3"]]
}

module "ap_subnet" {
  source                   = "./modules/vpcs/vpc_subnet"
  name                     = local.instances.net4.name
  project                  = var.networks.net4.project
  ip_cidr_range            = local.instances.net4.subnet
  network                  = module.vpc_networks["net4"].id
  region                   = local.instances.net4.region
  private_ip_google_access = true

  depends_on = [module.vpc_networks["net4"]]
}