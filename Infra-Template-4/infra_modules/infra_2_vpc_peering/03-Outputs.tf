output "peering-id" {
  value = google_compute_network_peering.peer[*].id
}

output "peering-reverse-id" {
  value = google_compute_network_peering.peer-reverse[*].id
}