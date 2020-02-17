### network/outputs.tf ###
output "k8s-network" {
    value = google_compute_network.k8s.name
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
