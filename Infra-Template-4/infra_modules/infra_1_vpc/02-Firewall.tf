resource "google_compute_firewall" "sg" { 
  count = length(var.vpc_config.networks)

  project = var.vpc_config.projects[count.index]
  name    = format("${var.env}-%s-firewall", var.vpc_config.networks[count.index])
  network = google_compute_network.vpc[count.index].id
  
  dynamic "allow" { 
    for_each = var.vpc_config.ingress_rules[count.index]

    content {
      protocol = allow.value.protocol
      ports = allow.value.ports
    }
  }
  source_ranges = var.vpc_config.source_ranges[count.index]

  depends_on = [google_compute_network.vpc]
}