# create a VPC 
resource "google_compute_network" "task2-vpc" {
  project                 = var.provider-details.project
  name                    = var.vpc-details.name
  auto_create_subnetworks = var.vpc-details.auto_create_subnetworks
}

# add subnet to the VPC
resource "google_compute_subnetwork" "task2-subnet" {
  name          = var.subnet-details.name
  ip_cidr_range = var.subnet-details.ip_cidr_range
  region        = var.provider-details.region
  network       = google_compute_network.task2-vpc.id
  depends_on    = [google_compute_network.task2-vpc, google_compute_firewall.task2-firewall-rules]
}

# firewall rule for the VPC to allow traffic on port 80 for the downstream VM
resource "google_compute_firewall" "task2-firewall-rules" {
  name    = var.firewall-rules-details.name
  network = google_compute_network.task2-vpc.id
  source_ranges = var.firewall-rules-details.source_ranges

  allow {
    protocol = var.firewall-rules-details.protocol
    ports    = var.firewall-rules-details.ports
  }

}
