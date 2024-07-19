remote_state {
    backend = "local"
    generate = {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }

    config = {
        path = "${path_relative_to_include()}/terraform.tfstate"
    }
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"

    contents = <<EOF
provider "google" {
    project = "terra-dome-420900"
    credentials = "terra-dome-420900-6642f8c08c0c.json"
    alias = "europe"
}

provider "google" {
    project = "terra-dome-2"
    credentials = "terra-dome-2-e78b187b47ab.json"
    alias = "northamerica"
}

provider "google" {
    project = "terra-dome-3"
    credentials = "terra-dome-3-d2a5a262dc47.json"
    alias = "southamerica"
}

provider "google" {
    project = "terra-dome-4"
    credentials = "terra-dome-4-9eccd9481b32.json"
    alias = "asiapacific"
}
EOF
}