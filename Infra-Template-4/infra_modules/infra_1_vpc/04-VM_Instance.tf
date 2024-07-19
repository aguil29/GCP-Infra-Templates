locals {
  disk_image_types = tomap({
    type1 = {
      family = "debian-12"
      project = "debian-cloud"
    }

    type2 = {
      family = "windows-2022"
      project = "windows-cloud"
    }
  })
}

data "google_compute_image" "os" { // make the disk image a local map
  for_each = local.disk_image_types

  family = each.value.family
  project = each.value.project
}

resource "google_service_account" "service_account" {
  count = length(var.vpc_config.networks)

  project = var.vpc_config.projects[count.index] // var.vpc_config.project[count.index]
  account_id = format("%s-custom-vm-sa", var.env)
  display_name = format("%s-VM Service Account", var.env)
}

resource "google_compute_instance" "vm" {
  count = length(var.vpc_config.cidr_subnets)

  name         = format("${var.env}-%s-instance", var.vpc_config.networks[count.index]) //var.name 
  project      = var.vpc_config.projects[count.index]
  machine_type = var.vpc_config.regions[count.index] != "asia-northeast3" ? "e2-medium" : "n2-standard-2"
  zone         = format("%s-a", var.vpc_config.regions[count.index])

  tags = [var.env, format("%s-instance", var.vpc_config.networks[count.index])]

  boot_disk {
    auto_delete = true
    # add Debian 12 image to boot disk
    initialize_params {
      image = var.vpc_config.regions[count.index] != "asia-northeast3" ? data.google_compute_image.os["type1"].self_link : data.google_compute_image.os["type2"].self_link
      size  = var.vpc_config.regions[count.index] != "asia-northeast3" ? 10 : 50
      type  = "pd-balanced"
      labels = {
        env = var.env
      }
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet[count.index].id
    access_config {
      // Ephemeral public IP
      network_tier = "STANDARD"
    }
  }

  metadata = {
    startup-script = file("startup_script.sh")
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.service_account[count.index].email
    scopes = ["cloud-platform"]
  }
}