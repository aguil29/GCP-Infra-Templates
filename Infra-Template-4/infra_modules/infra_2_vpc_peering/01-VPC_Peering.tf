data "google_compute_network" "network-nfo" {
  count = length(var.peering_config)

  name    = format("${var.env}-%s", var.peering_config[count.index].network.name)
  project = var.peering_config[count.index].network.project
}

data "google_compute_network" "peer-network-nfo" {
  count = length(var.peering_config)

  name    = format("${var.env}-%s", var.peering_config[count.index].peer_network.name)
  project = var.peering_config[count.index].peer_network.project
}

resource "google_compute_network_peering" "peer" {
  count = length(var.peering_config)

  name         = format("${var.env}-peering-cx-%d", count.index + 1)
  network      = data.google_compute_network.network-nfo[count.index].self_link
  peer_network = data.google_compute_network.peer-network-nfo[count.index].self_link

  depends_on = [data.google_compute_network.network-nfo,
  data.google_compute_network.peer-network-nfo]
}

resource "google_compute_network_peering" "peer-reverse" {
  count = length(var.peering_config)

  name         = format("${var.env}-peering-cx-%d", count.index + length(var.peering_config) + 2)
  network      = data.google_compute_network.peer-network-nfo[count.index].self_link
  peer_network = data.google_compute_network.network-nfo[count.index].self_link

  depends_on = [data.google_compute_network.network-nfo,
  data.google_compute_network.peer-network-nfo]
}