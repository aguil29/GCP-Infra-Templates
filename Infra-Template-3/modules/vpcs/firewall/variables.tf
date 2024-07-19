variable "project" {
    type = string
    default = null
}

variable "name" {}

variable "network" {}

variable "ingress_rules"{
    type = map(object({
        protocol = string
        port = list(number)
    }))
}


variable "source_ranges" {}