### storeage/output.tf ###
output "bucket_name" {
  value = google_storage_bucket.tf_code.id
}
