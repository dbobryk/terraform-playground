resource "google_container_cluster" "private_cluster" {
  provider = google-beta
  name     = "private-cluster"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.k8s-network
  subnetwork = var.k8s-private-subnet

  master_auth {
    username = var.username
    password = var.password

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    istio_config {
      disabled = false
    }
  }
}

resource "google_container_node_pool" "private_node_pool" {
  provider = google-beta
  name       = "private-node-pool"
  cluster    = google_container_cluster.private_cluster.name
  location   = "us-central1"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

}

resource "google_container_cluster" "public_cluster" {
  provider = google-beta
  name     = "public-cluster"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.k8s-network
  subnetwork = var.k8s-public-subnet

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    istio_config {
      disabled = false
    }
  }
}

resource "google_container_node_pool" "public_node_pool" {
  provider = google-beta
  name       = "public-node-pool"
  cluster    = google_container_cluster.public_cluster.name
  location   = "us-central1"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
