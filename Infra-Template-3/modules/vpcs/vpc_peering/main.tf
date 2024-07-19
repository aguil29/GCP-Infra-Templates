resource "google_compute_network_peering" "peer" {
  name         = var.name
  network      = var.network
  peer_network = var.peer_network
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)

output "id" {
  value = google_compute_network_peering.peer.id
}

output "name" {
  value = google_compute_network_peering.peer.name
}