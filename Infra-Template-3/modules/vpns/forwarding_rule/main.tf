resource "google_compute_forwarding_rule" "vpn_fwd_rule" {
   name = var.name 
   project = var.project
   target = var.target 
   ip_protocol = var.ip_protocol 
   ip_address = var.ip_address 
   port_range = var.port_range 
   region = var.region
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)

output "id" {
  value = google_compute_forwarding_rule.vpn_fwd_rule.id
}

output "description" {
  value = google_compute_forwarding_rule.vpn_fwd_rule.description
}

output "self_link" {
  value = google_compute_forwarding_rule.vpn_fwd_rule.self_link
}