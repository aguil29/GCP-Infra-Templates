# FWD RULES FOR THE SRC VPN
resource "google_compute_forwarding_rule" "src_fwd_rule" {
  count = length(local.src_flattened_rules)

  name        = format("${var.env}-src-vpn-fwd-rule-%d", count.index + 1)
  project     = local.src_flattened_rules[count.index].project
  target      = local.src_flattened_rules[count.index].target
  ip_address  = local.src_flattened_rules[count.index].ip_address
  ip_protocol = local.src_flattened_rules[count.index].ip_protocol
  port_range  = local.src_flattened_rules[count.index].port_range
  region      = local.src_flattened_rules[count.index].region
  labels = {"${var.env}" = format("src-vpn-fwd-rule-%d", count.index + 1)}

  depends_on = [google_compute_vpn_gateway.src_vpn_gwy, google_compute_address.src_static_ip]
}

# FWD RULES FOR THE DEST VPN
resource "google_compute_forwarding_rule" "dest_fwd_rule" {
  count = length(local.dest_flattened_rules)

  name        = format("${var.env}-dest-vpn-fwd-rule-%d", count.index + 1)
  project     = local.dest_flattened_rules[count.index].project
  target      = local.dest_flattened_rules[count.index].target
  ip_address  = local.dest_flattened_rules[count.index].ip_address
  ip_protocol = local.dest_flattened_rules[count.index].ip_protocol
  port_range  = local.dest_flattened_rules[count.index].port_range
  region      = local.dest_flattened_rules[count.index].region
labels = {"${var.env}" = format("dest-vpn-fwd-rule-%d", count.index + 1)}

  depends_on = [google_compute_vpn_gateway.dest_vpn_gwy, google_compute_address.dest_static_ip]
}