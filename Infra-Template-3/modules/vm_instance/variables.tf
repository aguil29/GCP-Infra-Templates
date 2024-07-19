variable "name" {}

variable "project" {
    type = string
    default = null
}


variable "machine_type" {}

variable "zone" {}

variable "boot_disk_image" {}

variable "boot_disk_size" {}

variable "boot_disk_type" {}

variable "subnetwork" {}

variable "network_tier" {}

variable "startup-script" {}

variable "service_account_email" {}