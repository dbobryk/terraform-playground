resource "random_id" "gcp_bucket_id" {
    byte_length = 2
}

resource "google_storage_bucket" "tf_code" {
    name = "dbobryk-${random_id.gcp_bucket_id.dec}"
    project = var.project_id
    location = "us"

    force_destroy = true

    labels = {
        "terraform" = "true"
    }
}
