resource "google_compute_subnetwork" "subnet" {
  count = length(var.vpc_config.networks)

  name                     = format("${var.env}-%s-subnet",var.vpc_config.networks[count.index])
  project                  = var.vpc_config.projects[count.index] 
  network                  = google_compute_network.vpc[count.index].id
  ip_cidr_range            = var.vpc_config.cidr_subnets[count.index]
  region                   = var.vpc_config.regions[count.index]
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }

  depends_on = [ google_compute_network.vpc ]
}