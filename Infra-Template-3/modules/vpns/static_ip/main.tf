resource "google_compute_address" "ip-address" {
   name = var.name
   project = var.project
   region = var.region
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)

output "address" {
   value = google_compute_address.ip-address.address
}

output "id" {
  value = google_compute_address.ip-address.id
}

output "description" {
  value = google_compute_address.ip-address.description
}

output "self_link" {
  value = google_compute_address.ip-address.self_link
}