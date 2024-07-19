variable "name" {}

variable "project" {
    type = string
    default = null
}


variable "target" {}

variable "ip_protocol"{}

variable "ip_address" {}

variable "port_range" {
    type = string
    default = null
}

variable "region" {}