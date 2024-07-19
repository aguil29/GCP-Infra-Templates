locals {
  # SUBNET ARRAY FOR EU/NA/SA/AP  
  subnets = ["10.175.40.0/24", "172.16.65.0/24", "172.16.37.0/24", "192.168.29.0/24"]


  # VM INSTANCE PARAMETER MAP FOR EU/NA/SA/AP
  instances = tomap({

    net1 = {
      name    = format("%s-subnet", var.networks.net1.name)
      subnet  = element(local.subnets, 0)
      region  = "europe-west6" # Zurich, Switzerland
      project = var.networks.net1.project
    }

    net2 = {
      name    = format("%s-subnet", var.networks.net2.name)
      subnet  = element(local.subnets, 1)
      region  = "us-west2" # Los Angeles, California, USA
      project = var.networks.net2.project
    }

    net3 = {
      name    = format("%s-subnet", var.networks.net3.name)
      subnet  = element(local.subnets, 2)
      region  = "southamerica-east1" # Sao Paulo, Sao Paulo, Brazil
      project = var.networks.net3.project
    }

    net4 = {
      name    = format("%s-subnet", var.networks.net4.name)
      subnet  = element(local.subnets, 3)
      region  = "asia-northeast3" # Seoul, South Korea
      project = var.networks.net4.project
    }
  })
}