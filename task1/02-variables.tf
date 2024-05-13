variable "provider-details" {
  description = "Provider details for resource deployment"
  type        = map(string)
}

variable "storage-bucket-details" {
  description = "Details for google storage bucket resource block"
  type        = tuple([string, bool, string, string])
}

variable "storage-bucket-access-control-details" {
  description = "Details for google storage bucket access control resource block"
  type        = map(string)
}

variable "storage-bucket-iam-binding-details" {
  description = "Details for google storage bucket iam binding resource block"
  type        = map(string)
}

variable "storage-bucket-object-details" {
  description = "Details for google storage bucket object resource block"
  type        = string
}

variable "google_bucket_url" {
  type        = string
  description = "Google storage bucket URL"
  default     = "https://storage.googleapis.com/"
}

# variable "credentials" {
#   type        = string
#   description = "The path to the service account key file"
#   default     = "iamagwe-40a98105e9fd.json"
# }
# gcloud cli auth replaces lines 32-36
