/*
TASK 1:
Create a publically accesible bucket in GCP with Terraform.  You must complete 
the following tasks.
1) Terraform script
2) Git Push the script to your Github
3) Output file must show the public link
4) Must have an index.html file within
*/

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.28.0"
    }
  }
}

provider "google" {
  project = var.provider-details.project_id
  region  = var.provider-details.region
  zone    = var.provider-details.zone
  # credentials = var.credentials
  # gcloud cli auth replaces line 24
}
