# FWD RULES FOR EUROPE TO ASIA-PACIFIC
module "eu2ap_vpn_forwarding_rule" {
  for_each = var.vpn_fwd_rules

  source      = "./modules/vpns/forwarding_rule"
  name        = format("eu-2-ap-vpn-fwd-%s", each.key)
  project     = var.networks.net1.project
  target      = module.eu2ap_vpn_gateway.id
  ip_address  = module.eu_static_ip.address
  ip_protocol = each.value.ip_protocol
  port_range  = each.value.port_range
  region      = local.instances.net1.region

  depends_on = [module.eu2ap_vpn_gateway, module.eu_static_ip]
}

# FWD RULES FOR ASIA-PACIFIC TO EUROPE
module "ap2eu_vpn_forwarding_rule" {
  for_each = var.vpn_fwd_rules

  source      = "./modules/vpns/forwarding_rule"
  name        = format("ap-2-eu-vpn-fwd-%s", each.key)
  project     = var.networks.net4.project
  target      = module.ap2eu_vpn_gateway.id
  ip_address  = module.ap_static_ip.address
  ip_protocol = each.value.ip_protocol
  port_range  = each.value.port_range
  region      = local.instances.net4.region

  depends_on = [module.ap2eu_vpn_gateway, module.ap_static_ip]
}