# Grab disk_images for instances
data "google_compute_image" "os" {
  for_each = var.disk_image

  family  = each.key
  project = each.value
}

# CREATE SERVICE ACCTS 
# EUROPE/AMERICAS/ASIA-PACIFIC
resource "google_service_account" "service_account" {
  for_each = var.networks

  project      = each.value.project
  account_id   = "custom-vm-sa"
  display_name = "VM Service Account"
}

# EUROPE INSTANCE
module "eu_instance" {
  source                = "./modules/vm_instance"
  name                  = format("%s-instance", var.networks.net1.name)
  project               = var.networks.net1.project
  zone                  = format("%s-a", local.instances.net1.region) 
  machine_type          = "e2-medium"
  boot_disk_image       = data.google_compute_image.os["debian-12"].self_link
  boot_disk_type        = "pd-balanced"
  boot_disk_size        = 10
  subnetwork            = module.eu_subnet.id
  network_tier          = "STANDARD"
  startup-script        = file("startup_script.sh")
  service_account_email = google_service_account.service_account["net1"].email

  depends_on = [module.vpc_networks["net1"], module.eu_subnet]
}

# NORTH AMERICA INSTANCE
module "na_instance" {

  source                = "./modules/vm_instance"
  name                  = format("%s-instance", var.networks.net2.name)
  project               = var.networks.net2.project
  zone                  = format("%s-a", local.instances.net2.region)
  machine_type          = "e2-medium"
  boot_disk_image       = data.google_compute_image.os["debian-12"].self_link
  boot_disk_type        = "pd-balanced"
  boot_disk_size        = 10
  subnetwork            = module.na_subnet.id
  network_tier          = "STANDARD"
  startup-script        = file("startup_script.sh")
  service_account_email = google_service_account.service_account["net2"].email

  depends_on = [module.vpc_networks["net2"], module.na_subnet]
}

# SOUTH AMERICA INSTANCE
module "sa_instance" {

  source                = "./modules/vm_instance"
  name                  = format("%s-instance", var.networks.net3.name)
  project               = var.networks.net3.project
  zone                  = format("%s-a", local.instances.net3.region)
  machine_type          = "e2-medium"
  boot_disk_image       = data.google_compute_image.os["debian-12"].self_link
  boot_disk_type        = "pd-balanced"
  boot_disk_size        = 10
  subnetwork            = module.sa_subnet.id
  network_tier          = "STANDARD"
  startup-script        = file("startup_script.sh")
  service_account_email = google_service_account.service_account["net3"].email

  depends_on = [module.vpc_networks["net3"], module.sa_subnet]
}

# ASIA-PACIFIC INSTANCE
module "ap_instance" {

  source                = "./modules/vm_instance"
  name                  = format("%s-instance", var.networks.net4.name)
  project               = var.networks.net4.project
  zone                  = format("%s-a", local.instances.net4.region)
  machine_type          = "n2-standard-2"
  boot_disk_image       = data.google_compute_image.os["windows-2022"].self_link
  boot_disk_type        = "pd-balanced"
  boot_disk_size        = 50
  subnetwork            = module.ap_subnet.id
  network_tier          = "STANDARD"
  startup-script        = file("startup_script.sh")
  service_account_email = google_service_account.service_account["net4"].email

  depends_on = [module.vpc_networks["net4"], module.ap_subnet]
}