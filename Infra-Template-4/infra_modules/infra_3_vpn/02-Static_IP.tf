resource "google_compute_address" "src_static_ip" {
  count = length(var.vpn_config)
  
  name    = format("${var.env}-%s-static-ip", var.vpn_config[count.index].src_network.name)
  project = var.vpn_config[count.index].src_network.project
  region  = var.vpn_config[count.index].src_network.region
  labels = {"${var.env}" = format("%s-static-ip", var.vpn_config[count.index].src_network.name)}
}

resource "google_compute_address" "dest_static_ip" {
  count = length(var.vpn_config)
  
  name    = format("${var.env}-%s-static-ip", var.vpn_config[count.index].dest_network.name)
  project = var.vpn_config[count.index].dest_network.project
  region  = var.vpn_config[count.index].dest_network.region
  labels = {"${var.env}" = format("%s-static-ip", var.vpn_config[count.index].src_network.name)}
}