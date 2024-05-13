output "bucket_url" {
  value = "${var.google_bucket_url}${google_storage_bucket.armageddon-task1.name}/index.html"
  # https://storage.googleapis.com/useful-art-422022-m8-armageddon-task1/index.html
}
