# Set up Next Hop FROM EUROPE TO ASIA-PACIFIC
module "eu2ap_vpn_route" {
  source              = "./modules/vpns/vpn_route"
  name                = "eu-hop-2-eu"
  project             = var.networks.net1.project
  dest_range          = element(local.subnets, 3)
  network             = module.vpc_networks["net1"].id
  next_hop_vpn_tunnel = module.eu2ap_vpn_tunnel.id
  priority            = 100

  depends_on = [module.eu2ap_vpn_tunnel, module.vpc_networks["net1"]]
}

# Set up Next Hop FROM ASIA-PACIFIC to EUROPE
module "ap2eu_vpn_route" {
  source              = "./modules/vpns/vpn_route"
  name                = "ap-hop-2-eu"
  project             = var.networks.net4.project
  dest_range          = element(local.subnets, 0)
  network             = module.vpc_networks["net4"].id
  next_hop_vpn_tunnel = module.ap2eu_vpn_tunnel.id
  priority            = 100

  depends_on = [module.ap2eu_vpn_tunnel, module.vpc_networks["net4"]]
}