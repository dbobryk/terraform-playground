provider "google" {
  credentials = file("account.json")
  project     = var.project_id
  region      = var.region
}

# terraform {
#   backend "gcs" {
#     bucket  = "dbobryk-tfstate-222"
#     prefix  = "terraform/state"
#   }
# }

module "storage" {
  source  = "./storage"
  project_id = var.project_id
}

module "network" {
  source = "./network"
}

module "compute" {
  source = "./compute"
  vms-network = module.network.vms-network
  vms-public-subnet = module.network.vms-public-subnet
  vms-private-subnet = module.network.vms-private-subnet
}
