data "google_client_config" "current" {}

provider "google-beta" {
  credentials = file("account.json")
  project     = var.project_id
  region      = var.region
}

provider "google" {
  credentials = file("account.json")
  project     = var.project_id
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket = "8637-terraform-6026"
    prefix = "terraform/state"
  }
}

module "storage" {
  source     = "./storage"
  project_id = var.project_id
}

module "network" {
  source     = "./network"
  project_id = var.project_id
}

module "compute" {
  source             = "./compute"
  vms-network        = module.network.vms-network
  vms-public-subnet  = module.network.vms-public-subnet
  vms-private-subnet = module.network.vms-private-subnet
}

module "gke" {
  source             = "./gke"
  k8s-network        = module.network.k8s-network
  k8s-private-subnet = module.network.k8s-private-subnet
  k8s-public-subnet  = module.network.k8s-public-subnet
  username           = var.username
  password           = var.password
}


module "k8s" {
  source   = "./k8s"
  username = var.username
  password = var.password

  host                   = "https://${module.gke.host}"
  client_certificate     = module.gke.client_certificate
  client_key             = module.gke.client_key
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  token = data.google_client_config.current.access_token
}
