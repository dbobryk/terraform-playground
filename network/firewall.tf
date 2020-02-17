resource "google_compute_firewall" "vms-public-firewall" {
  network     = google_compute_network.vms.id
  name        = "vms-public-firewall"
  target_tags = ["ssh"]


  depends_on = [
    google_compute_network.vms,
    google_compute_subnetwork.vms-public
  ]
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

}

resource "google_compute_firewall" "k8s-public-firewall" {
  network     = google_compute_network.k8s.id
  name        = "k8s-public-firewall"
  target_tags = ["ssh"]

  depends_on = [
    google_compute_network.k8s,
    google_compute_subnetwork.k8s-public
  ]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "vms-private-firewall" {
  network = google_compute_network.vms.id
  name    = "vms-private-firewall"


  depends_on = [
    google_compute_network.vms,
    google_compute_subnetwork.vms-private
  ]

  allow {
    protocol = "icmp"
  }
}