# FIREWALL SETTINGS - EU/NA/SA/AP
module "eu_firewall" {

  source        = "./modules/vpcs/firewall"
  name          = local.instances.net1.name
  project       = var.networks.net1.project
  network       = module.vpc_networks["net1"].id
  ingress_rules = var.eu_ingress

  source_ranges = concat(local.subnets, ["0.0.0.0/0"])

  depends_on = [module.vpc_networks["net1"]]
}

module "na_firewall" {

  source        = "./modules/vpcs/firewall"
  name          = local.instances.net2.name
  project       = var.networks.net2.project
  network       = module.vpc_networks["net2"].id
  ingress_rules = var.am_ingress

  source_ranges = concat([element(local.subnets, 0)], ["0.0.0.0/0"])

  depends_on = [module.vpc_networks["net2"]]
}

module "sa_firewall" {

  source        = "./modules/vpcs/firewall"
  name          = local.instances.net3.name
  project       = var.networks.net3.project
  network       = module.vpc_networks["net3"].id
  ingress_rules = var.am_ingress

  source_ranges = concat([element(local.subnets, 0)], ["0.0.0.0/0"])

  depends_on = [module.vpc_networks["net3"]]
}

module "ap_firewall" {

  source        = "./modules/vpcs/firewall"
  name          = local.instances.net4.name
  project       = var.networks.net4.project
  network       = module.vpc_networks["net4"].id
  ingress_rules = var.ap_ingress

  source_ranges = ["0.0.0.0/0"]

  depends_on = [module.vpc_networks["net4"]]
}