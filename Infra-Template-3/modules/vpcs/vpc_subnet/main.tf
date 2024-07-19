resource "google_compute_subnetwork" "subnet" {
  name = var.name
  project = var.project
  network = var.network
  ip_cidr_range = var.ip_cidr_range
  region = var.region
  private_ip_google_access = var.private_ip_google_access

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)

output "name" {
  value = google_compute_subnetwork.subnet.name
}

output "network" {
  value = google_compute_subnetwork.subnet.network
}

output "ip_cidr_range" {
  value = google_compute_subnetwork.subnet.ip_cidr_range
}

output "region" {
  value = google_compute_subnetwork.subnet.region
}

output "id" {
  value = google_compute_subnetwork.subnet.id
}

output "self_link" {
  value = google_compute_subnetwork.subnet.self_link
}