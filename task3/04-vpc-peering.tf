# create a network peering 
resource "google_compute_network_peering" "peering1" {
  name         = var.peering-details.one
  network      = google_compute_network.task3-vpc-europe.self_link
  peer_network = google_compute_network.task3-vpc-americas.self_link
  depends_on = [
    google_compute_network.task3-vpc-europe,
    google_compute_firewall.task3-firewall-rules-europe,
    google_compute_subnetwork.task3-subnet-europe,
    google_compute_network.task3-vpc-americas,
    google_compute_subnetwork.task3-subnet-iowa,
    google_compute_subnetwork.task3-subnet-oregon,
    google_compute_firewall.task3-firewall-rules-americas
  ]
}

# create a network peering 
resource "google_compute_network_peering" "peering2" {
  name         = var.peering-details.two
  network      = google_compute_network.task3-vpc-americas.self_link
  peer_network = google_compute_network.task3-vpc-europe.self_link
  depends_on = [
    google_compute_network.task3-vpc-europe,
    google_compute_firewall.task3-firewall-rules-europe,
    google_compute_subnetwork.task3-subnet-europe,
    google_compute_network.task3-vpc-americas,
    google_compute_subnetwork.task3-subnet-iowa,
    google_compute_subnetwork.task3-subnet-oregon,
    google_compute_firewall.task3-firewall-rules-americas
  ]
}