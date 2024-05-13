# create a VPC  
resource "google_compute_network" "task3-vpc-europe" {
  project                 = var.provider-details.project
  name                    = var.vpc-details.name.europe
  auto_create_subnetworks = var.vpc-details.auto_create_subnetworks
}

# add subnet to the VPC
resource "google_compute_subnetwork" "task3-subnet-europe" {
  name          = var.subnet-details.name.europe
  region        = var.subnet-details.region.europe
  ip_cidr_range = var.subnet-details.ip_cidr_range.europe
  network       = google_compute_network.task3-vpc-europe.id
  depends_on    = [google_compute_network.task3-vpc-europe, google_compute_firewall.task3-firewall-rules-europe]
}

# firewall rule for the VPC to allow traffic on port 80 for the downstream VM
resource "google_compute_firewall" "task3-firewall-rules-europe" {
  name    = var.firewall-rules-details.name.europe
  network = google_compute_network.task3-vpc-europe.id

  allow {
    protocol = var.firewall-rules-details.protocol
    ports    = var.firewall-rules-details.ports.europe
  }

  source_ranges = var.firewall-rules-details.source_ranges.europe
  depends_on    = [google_compute_network.task3-vpc-europe]
}