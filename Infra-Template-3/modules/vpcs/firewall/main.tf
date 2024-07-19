resource "google_compute_firewall" "sg" { 
  project = var.project
  name    = var.name 
  network = var.network 
  
  dynamic "allow" { 
    for_each = var.ingress_rules

    content {
      protocol = allow.value.protocol
      ports = allow.value.port
    }
  }
  source_ranges = var.source_ranges
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)
output "id" { 
  value = google_compute_firewall.sg.id
}

output "self_link" {
  value = google_compute_firewall.sg.self_link
}

output "description" {
  value = google_compute_firewall.sg.description
}