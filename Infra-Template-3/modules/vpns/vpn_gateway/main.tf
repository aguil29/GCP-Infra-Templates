resource "google_compute_vpn_gateway" "vpn_gwys" {
   name = var.name 
   project = var.project
   network = var.network 
   region = var.region 
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)

output "id" {
   value = google_compute_vpn_gateway.vpn_gwys.id
}

output "self_link" {
   value = google_compute_vpn_gateway.vpn_gwys.self_link
}

output "description" {
   value = google_compute_vpn_gateway.vpn_gwys.description
}