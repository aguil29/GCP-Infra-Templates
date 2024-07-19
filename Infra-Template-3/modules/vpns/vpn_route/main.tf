resource "google_compute_route" "route2" {
   name = var.name 
   project = var.project
   dest_range = var.dest_range 
   network = var.network 
   next_hop_vpn_tunnel = var.next_hop_vpn_tunnel 
   priority = var.priority
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)

output "id" {
  value = google_compute_route.route2.id
}

output "description" {
  value = google_compute_route.route2.description
}

output "self_link" {
  value = google_compute_route.route2.self_link
}