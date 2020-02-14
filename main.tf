provider "google" {
  credentials = file("account.json")
  project     = var.project_id
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket  = "dbobryk-tf-state-123"
    prefix  = "terraform/state"
  }
}

module "storage" {
  source  = "./storage"
  project_id = var.project_id
}

module "network" {
  source = "./network"
}

module "compute" {
  source = "./compute"
}
