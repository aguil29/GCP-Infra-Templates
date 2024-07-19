variable "name" {}

variable "project" {
    type = string
    default = null
}

variable "region" {}

variable "target_vpn_gateway" {}

variable "peer_ip" {}

variable "shared_secret" {}

variable "local_traffic_selector" {}

variable "remote_traffic_selector" {}