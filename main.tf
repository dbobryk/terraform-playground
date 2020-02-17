provider "google" {
  credentials = file("account.json")
  project     = var.project_id
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket = "dbobryk-terraform-testing-1212"
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

module "kubernetes" {
  source             = "./kubernetes"
  k8s-network        = module.network.k8s-network
  k8s-private-subnet = module.network.k8s-private-subnet
  k8s-public-subnet  = module.network.k8s-public-subnet
}
