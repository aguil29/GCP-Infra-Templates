# 1. ESTABLISH IPSEC CX FROM EUROPE TO ASIA-PACIFIC
module "eu2ap_vpn_gateway" {
  source  = "./modules/vpns/vpn_gateway"
  name    = format("%s-gwy", var.networks.net1.name)
  project = var.networks.net1.project
  network = module.vpc_networks["net1"].id
  region  = local.instances.net1.region

  depends_on = [module.vpc_networks["net1"]]
}

# 2. ESTABLISH IPSEC CX FROM ASIA-PACIFIC TO EUROPE
module "ap2eu_vpn_gateway" {
  source  = "./modules/vpns/vpn_gateway"
  name    = format("%s-gwy", var.networks.net4.name)
  project = var.networks.net4.project
  network = module.vpc_networks["net4"].id
  region  = local.instances.net4.region

  depends_on = [module.vpc_networks["net4"]]
}