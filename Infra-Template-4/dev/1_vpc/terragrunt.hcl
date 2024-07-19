terraform {
    source = "../../infra_modules/infra_1_vpc"
}

include "root" {
    path = find_in_parent_folders()
}

inputs = {
    env = "dev"
    vpc_config = {
        networks = ["spiel-mit-mir-hq", "spiel-mit-mir-northamerica", "spiel-mit-mir-southamerica", "spiel-mit-mir-asia-pacific"]

        cidr_subnets = ["10.175.40.0/24", "172.16.65.0/24", "172.16.37.0/24", "192.168.29.0/24"]

        projects = ["terra-dome-420900", "terra-dome-2", "terra-dome-3", "terra-dome-4"]

        regions = ["europe-west6", "us-west2", "southamerica-east1", "asia-northeast3"]

        ingress_rules = [
        //eu ingress
        {
            ingress = {
                protocol = "icmp"
            }

            ingress = {
                protocol = "tcp"
                ports     = [22, 80, 3389]
            }
        },

        // na ingress
        {
            ingress = {
                protocol = "icmp"
            }

            ingress = {
                protocol = "tcp"
                ports     = [22, 80]
            }
        },

        // sa ingress
        {
            ingress = {
                protocol = "icmp"
            }

            ingress = {
                protocol = "tcp"
                ports     = [22, 80]
            }
        },

    // ap ingress
        {
            ingress = {
                protocol = "icmp"
            }

            ingress = {
                protocol = "tcp"
                ports     = [3389]
            }
        }
    ]

  source_ranges = [
    // europe source_ranges
    ["10.175.40.0/24", "172.16.65.0/24", "172.16.37.0/24", "192.168.29.0/24", "0.0.0.0/0"],
    // na source_ranges
    ["10.175.40.0/24", "0.0.0.0/0"],
    // sa source_ranges
    ["10.175.40.0/24", "0.0.0.0/0"],
    // ap source_ranges
    ["0.0.0.0/0"]

  ]

}
}