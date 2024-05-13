# create a storage bucket
resource "google_storage_bucket" "armageddon-task1" {
  name          = "${var.provider-details.project_id}-armageddon-task1"
  location      = var.storage-bucket-details[0]
  force_destroy = var.storage-bucket-details[1]
  
  website {
    main_page_suffix = var.storage-bucket-details[2]
    not_found_page   = var.storage-bucket-details[3]
  }
}

# manage storage bucket Access Control List (ACLs) for a single entity/role pairing on the storage bucket
resource "google_storage_bucket_access_control" "public-rule" {
  bucket = google_storage_bucket.armageddon-task1.name
  entity = var.storage-bucket-access-control-details.entity
  role   = var.storage-bucket-access-control-details.role
}

# update the IAM policy to grant a role to a list of members for access to google storage bucket
resource "google_storage_bucket_iam_binding" "public-access" {
  bucket = google_storage_bucket.armageddon-task1.name
  role   = var.storage-bucket-iam-binding-details.role
  members = [var.storage-bucket-iam-binding-details.members]
}

# create a new object inside the existing storage bucket
resource "google_storage_bucket_object" "site-object" {
  name         = var.storage-bucket-details[2]
  source       = "${path.module}/public/index.html"
  content_type = var.storage-bucket-object-details
  bucket       = google_storage_bucket.armageddon-task1.name
}
