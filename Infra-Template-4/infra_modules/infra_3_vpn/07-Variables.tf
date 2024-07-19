variable "env" {
    type = string
}

variable "vpn_config" {

  type = list(object({
    src_network = object({
      name = string
      project = optional(string, null)
      region = string 
      cidr_subnet = string
    })
    
    dest_network = object({
      name = string
      project = optional(string, null)
      region = string
      cidr_subnet = string
    })

    vpn_fwd_rules = list(object({
      ip_protocol = string
      port_range = optional(string, null)
  }))

  }))
}