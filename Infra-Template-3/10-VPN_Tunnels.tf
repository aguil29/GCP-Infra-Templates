# VPN TUNNEL FROM EUROPE TO ASIA-PACIFIC
module "eu2ap_vpn_tunnel" {
  source                  = "./modules/vpns/vpn_tunnel"
  name                    = "eu-2-ap-tunnel"
  project                 = var.networks.net1.project
  region                  = local.instances.net1.region
  peer_ip                 = module.ap_static_ip.address
  shared_secret           = sensitive("itsaseacreature") # NEVER EXPOSE SECRETS/SENSITIVE INFO IN TF MODULE
  target_vpn_gateway      = module.eu2ap_vpn_gateway.id
  local_traffic_selector  = [element(local.subnets, 0)]
  remote_traffic_selector = [element(local.subnets, 3)]

  depends_on = [module.eu2ap_vpn_forwarding_rule["rule1"],
    module.eu2ap_vpn_forwarding_rule["rule2"],
    module.eu2ap_vpn_forwarding_rule["rule3"],
    module.ap_static_ip,
  module.eu2ap_vpn_gateway]
}

# VPN TUNNEL FROM ASIA-PACIFIC TO EUROPE
module "ap2eu_vpn_tunnel" {
  source                  = "./modules/vpns/vpn_tunnel"
  name                    = "ap-2-eu-tunnel"
  project                 = var.networks.net4.project
  region                  = local.instances.net4.region
  peer_ip                 = module.eu_static_ip.address
  shared_secret           = sensitive("itsaseacreature") # NEVER EXPOSE SECRETS/SENSITIVE INFO IN TF MODULE
  target_vpn_gateway      = module.ap2eu_vpn_gateway.id
  local_traffic_selector  = [element(local.subnets, 3)]
  remote_traffic_selector = [element(local.subnets, 0)]

  depends_on = [module.ap2eu_vpn_forwarding_rule["rule1"],
    module.ap2eu_vpn_forwarding_rule["rule2"],
    module.ap2eu_vpn_forwarding_rule["rule3"],
    module.eu_static_ip,
  module.ap2eu_vpn_gateway]
}