terraform {
    source = "../../infra_modules/infra_2_vpc_peering"
}

include "root" {
    path = find_in_parent_folders()
}

inputs = {
    env = "staging"
    peering_config = [
    {
        network = {
            name = "spiel-mit-mir-northamerica"
            project      = "terra-dome-2"
        }

        peer_network = {
            name = "spiel-mit-mir-hq"
            project      = "terra-dome-420900"
        }
    },

    {
        network = {
             name = "spiel-mit-mir-southamerica"
            project      = "terra-dome-3"
        }

        peer_network = {
            name = "spiel-mit-mir-hq"
            project      = "terra-dome-420900"
        }
    }
    ]
}