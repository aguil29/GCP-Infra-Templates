# Set up Next Hop VPN Route FROM SRC TO DEST
resource "google_compute_route" "src_vpn_route" {
  count = length(var.vpn_config)
  
  name                = format("${var.env}-%s-vpn-route", var.vpn_config[count.index].src_network.name)
  project             = var.vpn_config[count.index].src_network.project
  dest_range          = var.vpn_config[count.index].dest_network.cidr_subnet
  network             = data.google_compute_network.src-nfo[count.index].self_link
  next_hop_vpn_tunnel = google_compute_vpn_tunnel.src_vpn_tunnel[count.index].id
  priority            = 100
  tags = [var.env, format("%s-vpn-route", var.vpn_config[count.index].src_network.name)]

  depends_on = [google_compute_vpn_tunnel.src_vpn_tunnel, data.google_compute_network.src-nfo]
}

# Set up Next Hop VPN Route FROM DEST to SRC
resource "google_compute_route" "dest_vpn_route" {
  count = length(var.vpn_config)
  
  name                = format("${var.env}-%s-vpn-route", var.vpn_config[count.index].dest_network.name)
  project             = var.vpn_config[count.index].dest_network.project
  dest_range          = var.vpn_config[count.index].src_network.cidr_subnet
  network             = data.google_compute_network.dest-nfo[count.index].self_link
  next_hop_vpn_tunnel = google_compute_vpn_tunnel.dest_vpn_tunnel[count.index].id
  priority            = 100
  tags = [var.env, format("%s-vpn-route", var.vpn_config[count.index].dest_network.name)]

  depends_on = [google_compute_vpn_tunnel.dest_vpn_tunnel, data.google_compute_network.dest-nfo]
}