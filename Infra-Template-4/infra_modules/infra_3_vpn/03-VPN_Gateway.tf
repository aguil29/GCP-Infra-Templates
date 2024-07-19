# 1. ESTABLISH IPSEC CX FROM SOURCE TO DESTINATION
resource "google_compute_vpn_gateway" "src_vpn_gwy" {
  count = length(var.vpn_config)

  name    = format("${var.env}-%s-gwy", var.vpn_config[count.index].src_network.name)
  project = var.vpn_config[count.index].src_network.project
  network = data.google_compute_network.src-nfo[count.index].self_link
  region  = var.vpn_config[count.index].src_network.region
}

# 2. ESTABLISH IPSEC CX FROM DESTINATION TO SOURCE
resource "google_compute_vpn_gateway" "dest_vpn_gwy" {
  count = length(var.vpn_config)
  
  name    = format("${var.env}-%s-gwy", var.vpn_config[count.index].dest_network.name)
  project = var.vpn_config[count.index].dest_network.project
  network = data.google_compute_network.dest-nfo[count.index].self_link
  region  = var.vpn_config[count.index].dest_network.region
}