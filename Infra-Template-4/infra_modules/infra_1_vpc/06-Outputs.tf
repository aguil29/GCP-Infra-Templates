output "vpc_network" {
    value = google_compute_network.vpc[*].self_link
}

output "vpc_subnetwork" {
    value = google_compute_subnetwork.subnet[*].self_link
}

output "vm_external_ip" {
    value = google_compute_instance.vm[*].network_interface[0].access_config[0].nat_ip
}

output "vm_internal_ip" {
  value = google_compute_instance.vm[*].network_interface[0].network_ip
}