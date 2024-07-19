terraform {
    source = "../../infra_modules/infra_3_vpn"
}

include "root" {
    path = find_in_parent_folders()
}

inputs = {
    env = "staging"
    vpn_config = [
        {
            src_network = {
                name = "spiel-mit-mir-asia-pacific"
                project = "terra-dome-4"
                region = "asia-northeast3"
                cidr_subnet = "192.168.29.0/24"
            }

            dest_network = {
                name = "spiel-mit-mir-hq"
                project = "terra-dome-420900"
                region = "europe-west6"
                cidr_subnet = "10.175.40.0/24"
            }

            vpn_fwd_rules = [
            
                {
                    ip_protocol = "ESP"
                },

                {
                    ip_protocol = "UDP"
                    port_range = "500"
                },

                {
                    ip_protocol = "UDP"
                    port_range = "4500"
                }
            ]
        }
    ]
}