# create a VPC 
resource "google_compute_network" "task3-vpc-americas" {
  project                 = var.provider-details.project
  name                    = var.vpc-details.name.americas
  auto_create_subnetworks = var.vpc-details.auto_create_subnetworks
}

# add subnet to the VPC
resource "google_compute_subnetwork" "task3-subnet-iowa" {
  name          = var.subnet-details.name.americas1
  region        = var.subnet-details.region.americas1
  ip_cidr_range = var.subnet-details.ip_cidr_range.americas1
  network       = google_compute_network.task3-vpc-americas.id
  depends_on    = [google_compute_network.task3-vpc-americas, google_compute_firewall.task3-firewall-rules-americas]
}

# add subnet to the VPC
resource "google_compute_subnetwork" "task3-subnet-oregon" {
  name          = var.subnet-details.name.americas2
  region        = var.subnet-details.region.americas2
  ip_cidr_range = var.subnet-details.ip_cidr_range.americas2
  network       = google_compute_network.task3-vpc-americas.id
  depends_on    = [google_compute_network.task3-vpc-americas, google_compute_firewall.task3-firewall-rules-americas]
}

# firewall rule for the VPC to allow traffic on port 3389 for the downstream VMs
resource "google_compute_firewall" "task3-firewall-rules-americas" {
  name    = var.firewall-rules-details.name.americas
  network = google_compute_network.task3-vpc-americas.id

  allow {
    protocol = var.firewall-rules-details.protocol
    ports    = var.firewall-rules-details.ports.americas
  }

  source_ranges = var.firewall-rules-details.source_ranges.americas
  depends_on    = [google_compute_network.task3-vpc-americas]
}