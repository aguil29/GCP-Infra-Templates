variable "env" {
  type = string
}

variable "peering_config" {
  type = list(object({
    network = object({
      name = string
      project      = optional(string, null)
    })

    peer_network = object({
      name = string
      project      = optional(string, null)
    })
  }))
}