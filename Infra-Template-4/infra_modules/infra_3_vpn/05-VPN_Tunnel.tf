# VPN TUNNEL FROM SRC TO DEST
resource "google_compute_vpn_tunnel" "src_vpn_tunnel" {
  count = length(var.vpn_config)
  
  name                    = format("${var.env}-src-tunnel-%d", count.index + 1)
  project                 = var.vpn_config[count.index].src_network.project
  region                  = var.vpn_config[count.index].src_network.region
  peer_ip                 = google_compute_address.dest_static_ip[count.index].address
  shared_secret           = sensitive("itsaseacreature")
  target_vpn_gateway      = google_compute_vpn_gateway.src_vpn_gwy[count.index].id
  local_traffic_selector  = [var.vpn_config[count.index].src_network.cidr_subnet]
  remote_traffic_selector = [var.vpn_config[count.index].dest_network.cidr_subnet]
  labels = { "${var.env}" = format("src-tunnel-%d", count.index + 1) }

  depends_on = [google_compute_forwarding_rule.src_fwd_rule,
    google_compute_address.dest_static_ip,
  google_compute_vpn_gateway.src_vpn_gwy]

}

# VPN TUNNEL FROM DEST TO SRC
resource "google_compute_vpn_tunnel" "dest_vpn_tunnel" {
  count = length(var.vpn_config)

  name                    = format("${var.env}-dest-tunnel-%d", count.index + 1)
  project                 = var.vpn_config[count.index].dest_network.project
  region                  = var.vpn_config[count.index].dest_network.region
  peer_ip                 = google_compute_address.src_static_ip[count.index].address
  shared_secret           = sensitive("itsaseacreature")
  target_vpn_gateway      = google_compute_vpn_gateway.dest_vpn_gwy[count.index].id
  local_traffic_selector  = [var.vpn_config[count.index].dest_network.cidr_subnet]
  remote_traffic_selector = [var.vpn_config[count.index].src_network.cidr_subnet]
  labels = { "${var.env}" = format("dest-tunnel-%d", count.index + 1) }

  depends_on = [google_compute_forwarding_rule.dest_fwd_rule,
    google_compute_address.src_static_ip,
  google_compute_vpn_gateway.dest_vpn_gwy]
}