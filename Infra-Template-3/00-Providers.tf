terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

# Set up providers for each network by project
# Four projects are used for Europe (HQ), Americas, and Asia-Pacific

# Europe Provider
provider "google" {
  # Configuration options
  project = var.networks.net1.project
  credentials = "terra-dome-420900-6642f8c08c0c.json"
  alias       = "europe"
}

# North America Provider
provider "google" {
  # Configuration options
  project = var.networks.net2.project
  credentials = "terra-dome-2-e78b187b47ab.json"
  alias       = "northamerica"
}

# South America Provider
provider "google" {
  # Configuration options
  project = var.networks.net3.project
  credentials = "terra-dome-3-d2a5a262dc47.json"
  alias       = "southamerica"
}

# Asia-Pacific Provider
provider "google" {
  project = var.networks.net4.project
  credentials = "terra-dome-4-9eccd9481b32.json"
  alias       = "asiapacific"
}