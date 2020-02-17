### network/outputs.tf ###

# K8s-Networking
output "k8s-network" {
  value = google_compute_network.k8s.name
}

output "k8s-public-subnet" {
  value = google_compute_subnetwork.k8s-public.name
}

output "k8s-private-subnet" {
  value = google_compute_subnetwork.k8s-private.name
}

# VM-Networking
output "vms-network" {
  value = google_compute_network.vms.name
}

output "vms-public-subnet" {
  value = google_compute_subnetwork.vms-public.name
}

output "vms-private-subnet" {
  value = google_compute_subnetwork.vms-private.name
}
