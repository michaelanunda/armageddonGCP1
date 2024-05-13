/*
TASK 2:
Create a publically accessuble web page with Terraform.  You must complete the following
1) Terraform Script with a VPC
2) Terraform script must have a VM within your VPC.
3) The VM must have the homepage on it.
4) The VM must have an publically accessible link to it.
5) You must Git Push your script to your Github.
6) Output file must show 1) Public IP, 2) VPC, 3) Subnet of the VM, 4) Internal IP of the VM.
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
  project = var.provider-details.project
  region  = var.provider-details.region
  zone    = var.provider-details.zone
  # credentials = var.credentials
  # gcloud cli auth replaces line 25
}
