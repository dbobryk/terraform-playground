data "google_compute_zones" "available" {
  project = var.project_id
}

resource "google_compute_network" "k8s" {
  name                    = "k8s"
  auto_create_subnetworks = false
}

resource "google_compute_network" "vms" {
  name                    = "vms"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "k8s-public" {
  name          = "k8s-public"
  ip_cidr_range = "10.1.0.0/16"
  network       = google_compute_network.k8s.id
}

resource "google_compute_subnetwork" "k8s-private" {
  name          = "k8s-private"
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.k8s.id
}

resource "google_compute_subnetwork" "vms-public" {
  name          = "vms-public"
  ip_cidr_range = "10.3.0.0/16"
  network       = google_compute_network.vms.id
}

resource "google_compute_subnetwork" "vms-private" {
  name          = "vms-private"
  ip_cidr_range = "10.4.0.0/16"
  network       = google_compute_network.vms.id
}

