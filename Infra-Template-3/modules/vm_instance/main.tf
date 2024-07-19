resource "google_compute_instance" "vm" {
  name         = var.name 
  project = var.project
  machine_type = var.machine_type
  zone         = var.zone 

  tags = ["net", "worth"]

  boot_disk {
    auto_delete = true
    # add Debian 12 image to boot disk
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    subnetwork = var.subnetwork
    access_config {
      // Ephemeral public IP
      network_tier = var.network_tier
    }
  }

  metadata = {
    startup-script = var.startup-script
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}

## Output values used for module to reference attributes in resources in main.tf ##
##       ADD AS MANY AS ATTRIBUTES NEEDED :-)

output "internal_ip" {
    value = google_compute_instance.vm.network_interface[0].network_ip
}

output "nat_ip" {
    value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}

output "id" {
  value = google_compute_instance.vm.id
}

output "description" {
  value = google_compute_instance.vm.description
}

output "self_link" {
  value = google_compute_instance.vm.self_link
}