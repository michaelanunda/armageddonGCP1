/*
TASK 3:
You must complete the following scenerio.

A European gaming company is moving to GCP.  It has the following requirements in it's first stage migration to the Cloud:

A) You must choose a region in Europe to host it's prototype gaming information.  This page must only be on a RFC 1918 Private 10 net and can't be accessible from the Internet.
B) The Americas must have 2 regions and both must be RFC 1918 172.16 based subnets.  They can peer with HQ in order to view the homepage however, they can only view the page on port 80.
C) Asia Pacific region must be choosen and it must be a RFC 1918 192.168 based subnet.  This subnet can only VPN into HQ.  Additionally, only port 3389 is open to Asia. No 80, no 22.

Deliverables.
1) Complete Terraform for the entire solution.
2) Git Push of the solution to your GitHub.
3) Screenshots showing how the HQ homepage was accessed from both the Americas and Asia Pacific. 

https://www.techtarget.com/whatis/definition/RFC-1918#:~:text=RFC%201918%20was%20used%20to,10.0.
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
}