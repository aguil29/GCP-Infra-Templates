resource "google_compute_network" "vpc" {
  name = var.name
  project = var.project
  auto_create_subnetworks = var.auto_create_subnetworks
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)

output "id" {
  value = google_compute_network.vpc.id
}

output "description" {
  value = google_compute_network.vpc.description
}

output "self_link" {
  value = google_compute_network.vpc.self_link
}