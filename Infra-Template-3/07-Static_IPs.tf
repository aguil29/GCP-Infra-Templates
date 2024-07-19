# Create STATIC IPs 
# EUROPE(HQ) AND ASIA-PACIFIC 
module "eu_static_ip" {
  source  = "./modules/vpns/static_ip"
  name    = format("%s-static-ip", var.networks.net1.name)
  project = var.networks.net1.project
  region  = local.instances.net1.region
}

module "ap_static_ip" {
  source  = "./modules/vpns/static_ip"
  name    = format("%s-static-ip", var.networks.net4.name)
  project = var.networks.net4.project
  region  = local.instances.net4.region
}