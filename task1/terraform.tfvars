provider-details = {
  "project_id" = "useful-art-422022-m8"
  "region"     = "us-east1"
  "zone"       = "us-east1-a"
}

storage-bucket-details = ["US", true, "index.html", "404.html"]

storage-bucket-access-control-details = {
  "entity" = "allUsers"
  "role"   = "READER"
}

storage-bucket-iam-binding-details = {
  "role"    = "roles/storage.objectViewer"
  "members" = "allUsers"
}

storage-bucket-object-details = "text/html"
