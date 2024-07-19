# 1. AMERICAS PEERING TO EUROPE (HQ)

# 1A. NORTH AMERICA PEER TO EUROPE (HQ)
module "na2eu_vpc_peering" {
  source       = "./modules/vpcs/vpc_peering"
  name         = "na-peering-2-eu"
  network      = module.vpc_networks["net2"].id
  peer_network = module.vpc_networks["net1"].id

  depends_on = [module.vpc_networks["net1"], module.vpc_networks["net2"]]
}

# 1B. SOUTH AMERICA PEER TO EUROPE (HQ)
module "sa2eu_vpc_peering" {

  source       = "./modules/vpcs/vpc_peering"
  name         = "sa-peering-2-eu"
  network      = module.vpc_networks["net3"].id
  peer_network = module.vpc_networks["net1"].id

  depends_on = [module.vpc_networks["net1"], module.vpc_networks["net3"]]
}

# 2. EUROPE (HQ) PEERING TO AMERICAS

# 2A. EUROPE (HQ) PEER TO NORTH AMERICA
module "eu2na_vpc_peering" {
  source       = "./modules/vpcs/vpc_peering"
  name         = "eu-peering-2-na"
  network      = module.vpc_networks["net1"].id
  peer_network = module.vpc_networks["net2"].id

  depends_on = [module.vpc_networks["net1"], module.vpc_networks["net2"]]
}

# 2B. EUROPE (HQ) PEER TO SOUTH AMERICA
module "eu2sa_vpc_peering" {
  source       = "./modules/vpcs/vpc_peering"
  name         = "eu-peering-2-sa"
  network      = module.vpc_networks["net1"].id
  peer_network = module.vpc_networks["net3"].id

  depends_on = [module.vpc_networks["net1"], module.vpc_networks["net3"]]
}