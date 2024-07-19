locals {
 # Create local variable to iterate through the source vpn fwd rules array
 src_flattened_rules = flatten([
    for vpn_config in var.vpn_config : [
      for vpn_fwd_rules in vpn_config.vpn_fwd_rules : {
        project = vpn_config.src_network.project
        target = google_compute_vpn_gateway.src_vpn_gwy[0].id
        ip_address = google_compute_address.src_static_ip[0].id
        ip_protocol = vpn_fwd_rules.ip_protocol
        port_range = vpn_fwd_rules.port_range
        region = vpn_config.src_network.region
      }
    ]
  ])

# Create local variable to iterate through the destination vpn fwd rules array
  dest_flattened_rules = flatten([
    for vpn_config in var.vpn_config : [
      for vpn_fwd_rules in vpn_config.vpn_fwd_rules : {
        project = vpn_config.dest_network.project
        target = google_compute_vpn_gateway.dest_vpn_gwy[0].id
        ip_address = google_compute_address.dest_static_ip[0].id
        ip_protocol = vpn_fwd_rules.ip_protocol
        port_range = vpn_fwd_rules.port_range
        region = vpn_config.dest_network.region
      }
    ]
  ])   
}

# Grab Network Data for SRC and DEST
data "google_compute_network" "src-nfo" {
  count = length(var.vpn_config)

  name = format("${var.env}-%s",var.vpn_config[count.index].src_network.name)
  project = var.vpn_config[count.index].src_network.project
}

data "google_compute_network" "dest-nfo" {
  count = length(var.vpn_config)

  name = format("${var.env}-%s",var.vpn_config[count.index].dest_network.name)
  project = var.vpn_config[count.index].dest_network.project
}