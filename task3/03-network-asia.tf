# create a VPC 
resource "google_compute_network" "task3-vpc-asia" {
  project                 = var.provider-details.project
  name                    = var.vpc-details.name.asia
  auto_create_subnetworks = var.vpc-details.auto_create_subnetworks
}

# add subnet to the VPC
resource "google_compute_subnetwork" "task3-subnet-asia" {
  name          = var.subnet-details.name.asia
  region        = var.subnet-details.region.asia
  ip_cidr_range = var.subnet-details.ip_cidr_range.asia
  network       = google_compute_network.task3-vpc-asia.id
  depends_on    = [google_compute_network.task3-vpc-asia, google_compute_firewall.task3-firewall-rules-asia]
}

# firewall rule for the VPC to allow traffic on port 3389 for the downstream VM
resource "google_compute_firewall" "task3-firewall-rules-asia" {
  name    = var.firewall-rules-details.name.asia
  network = google_compute_network.task3-vpc-asia.id

  allow {
    protocol = var.firewall-rules-details.protocol
    ports    = var.firewall-rules-details.ports.asia
  }

  source_ranges = var.firewall-rules-details.source_ranges.asia
  depends_on    = [google_compute_network.task3-vpc-asia]
}