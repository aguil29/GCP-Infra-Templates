resource "google_compute_network" "vpc" {
  count = length(var.vpc_config.networks)
  
  name = format("${var.env}-%s",var.vpc_config.networks[count.index])
  project = var.vpc_config.projects[count.index]
  auto_create_subnetworks = false
}