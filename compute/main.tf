resource "google_compute_instance" "vm-public" {
  name         = "vm-public"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["ssh", "terraform"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    subnetwork = var.vms-public-subnet
  }
}

resource "google_compute_instance" "vm-private" {
  name         = "vm-private"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    subnetwork = var.vms-private-subnet
  }
}
