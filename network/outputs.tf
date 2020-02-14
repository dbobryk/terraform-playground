### network/outputs.tf ###
output "k8s-network" {
    value = google_compute_network.k8s.id
}



## VM-Networking
output "vms-network" {
    value = google_compute_network.vms.id
}

output "vms-network-public-subnet" {
    value = google_compute_subnetwork.vms-public.id
}

output "vms-network-private-subnet" {
    value = google_compute_subnetwork.vms-private.id
}
