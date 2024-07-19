variable "env" {
    type = string
}

variable "vpc_config" {
    type = object({

        networks = list(string)

        cidr_subnets = list(string)

        projects = optional(list(string), null)

        regions = list(string)

        ingress_rules = list(object({

            ingress = object({
                protocol = string
                ports = optional(list(number), null)
            })

        }))

        source_ranges = list(list(string))
    })
}
