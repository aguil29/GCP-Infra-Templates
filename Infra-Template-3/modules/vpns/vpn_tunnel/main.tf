resource "google_compute_vpn_tunnel" "tunnel" {
  name = var.name 
  project = var.project
  region = var.region
  target_vpn_gateway = var.target_vpn_gateway
  peer_ip = var.peer_ip 
  shared_secret = var.shared_secret 
  ike_version = 2
  local_traffic_selector = var.local_traffic_selector 
  remote_traffic_selector = var.remote_traffic_selector
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)

output "id" {
  value = google_compute_vpn_tunnel.tunnel.id
}

output "description" {
  value = google_compute_vpn_tunnel.tunnel.description
}

output "self_link" {
  value = google_compute_vpn_tunnel.tunnel.self_link
}