variable "project" {
    type = string
    default = null
}


variable "network"{}

variable "ip_cidr_range"{
    type = string
}

variable "region"{
    type = string
    description = "Gcp region"
}

variable "name"{}

variable "private_ip_google_access"{}