output "Task_3" {
  value = "Solutions."
}

output "_1_subnet_europe-hq" {
  value = element(local.subnets, 0)
}

output "_1_subnet_northamerica" {
  value = element(local.subnets, 1)
}

output "_1_subnet_southamerica" {
  value = element(local.subnets, 2)
}

output "_1_subnet_asiapacific" {
  value = element(local.subnets, 3)
}

output "_2_internal_ip_europe" {
  value = module.eu_instance.internal_ip
}

output "_2_nat_ip_europe" {
  value = module.eu_instance.nat_ip
}

output "_3_vpn_static_ip_europe" {
  value = module.eu_static_ip.address
}

output "_4_vpn_static_ip_asia-pacific" {
  value = module.ap_static_ip.address
}