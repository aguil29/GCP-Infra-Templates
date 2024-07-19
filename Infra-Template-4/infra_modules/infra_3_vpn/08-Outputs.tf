output "src_vpn_gwy_link" {
  value = google_compute_vpn_gateway.src_vpn_gwy[*].self_link
}

output "dest_vpn_gwy_link" {
  value = google_compute_vpn_gateway.dest_vpn_gwy[*].self_link
}

output "dest_static_address" {
  value = google_compute_address.dest_static_ip[*].address
}

output "src_static_address" {
  value = google_compute_address.src_static_ip[*].address
}

output "src_vpn_route_link" {
  value = google_compute_route.src_vpn_route[*].self_link
}

output "dest_vpn_route_link" {
  value = google_compute_route.dest_vpn_route[*].self_link
}

output "src_vpn_tunnel_link" {
  value = google_compute_vpn_tunnel.src_vpn_tunnel[*].self_link
}

output "dest_vpn_tunnel_link" {
  value = google_compute_vpn_tunnel.dest_vpn_tunnel[*].self_link
}