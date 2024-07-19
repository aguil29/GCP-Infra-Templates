# Networks - Europe (HQ)/Americas/Asia-Pacific
module "vpc_networks" {
  for_each = var.networks

  source                  = "./modules/vpcs/vpc_network"
  name                    = each.value.name
  project                 = each.value.project
  auto_create_subnetworks = false
}