# VPN-to-europe

# create VPN gateway to europe VPC
resource "google_compute_vpn_gateway" "to-europe-gateway" {
  name    = var.vpn-details.gateway-name-europe
  region  = google_compute_subnetwork.task3-subnet-asia.region
  network = google_compute_network.task3-vpc-asia.id
}

# create a static ip resource for VPN gateway to europe
resource "google_compute_address" "vpn-static-ip-to-europe" {
  name   = var.vpn-details.static-name-europe
  region = google_compute_subnetwork.task3-subnet-asia.region
}


# create an ESP forwarding rule resource for VPN gateway to europe
resource "google_compute_forwarding_rule" "esp-asia-to-europe" {
  name        = var.vpn-details.esp-name-europe
  ip_protocol = var.vpn-details.ip-protocol-esp
  ip_address  = google_compute_address.vpn-static-ip-to-europe.address
  target      = google_compute_vpn_gateway.to-europe-gateway.id
  region      = google_compute_subnetwork.task3-subnet-asia.region
}

# create an UDP 500 forwarding rule resource for VPN gateway to europe
resource "google_compute_forwarding_rule" "asia-to-europe_udp500" {
  name        = var.vpn-details.udp500-name-asia
  ip_protocol = var.vpn-details.ip-protocol-udp
  port_range  = var.vpn-details.port-range500
  ip_address  = google_compute_address.vpn-static-ip-to-europe.address
  target      = google_compute_vpn_gateway.to-europe-gateway.id
  region      = google_compute_subnetwork.task3-subnet-asia.region
}

# create an UDP 4500 forwarding rule resource for VPN gateway to europe
resource "google_compute_forwarding_rule" "asia-to-europe_udp4500" {
  name        = var.vpn-details.udp4500-name-asia
  ip_protocol = var.vpn-details.ip-protocol-udp
  port_range  = var.vpn-details.port-range4500
  ip_address  = google_compute_address.vpn-static-ip-to-europe.address
  target      = google_compute_vpn_gateway.to-europe-gateway.id
  region      = google_compute_subnetwork.task3-subnet-asia.region
}

# create a VPN tunnel resource for VPN gateway to europe
resource "google_compute_vpn_tunnel" "to-europe" {
  name                    = var.vpn-details.tunnel-name-europe
  peer_ip                 = google_compute_address.vpn-static-ip-to-asia.address
  shared_secret           = var.vpn-details.tunnel-shared-secret
  local_traffic_selector  = [google_compute_subnetwork.task3-subnet-asia.ip_cidr_range]
  remote_traffic_selector = [google_compute_subnetwork.task3-subnet-europe.ip_cidr_range]
  target_vpn_gateway      = google_compute_vpn_gateway.to-europe-gateway.id
  depends_on = [
    google_compute_forwarding_rule.esp-asia-to-europe,
    google_compute_forwarding_rule.asia-to-europe_udp500,
    google_compute_forwarding_rule.asia-to-europe_udp4500
  ]
}

# create a route resource for VPN gateway to europe
resource "google_compute_route" "asia-to-europe-route" {
  name                = var.vpn-details.route-name-europe
  network             = google_compute_network.task3-vpc-asia.name
  dest_range          = var.subnet-details.ip_cidr_range.europe
  next_hop_vpn_tunnel = google_compute_vpn_tunnel.to-europe.id
}



# VPN-to-asia

# create VPN gateway to asia VPC
resource "google_compute_vpn_gateway" "to-asia-gateway" {
  name    = var.vpn-details.gateway-name-asia
  region  = google_compute_subnetwork.task3-subnet-europe.region
  network = google_compute_network.task3-vpc-europe.id
}

# create a static ip resource for VPN gateway to asia
resource "google_compute_address" "vpn-static-ip-to-asia" {
  name   = var.vpn-details.static-name-asia
  region = google_compute_subnetwork.task3-subnet-europe.region
}

# create an ESP forwarding rule resource for VPN gateway to asia
resource "google_compute_forwarding_rule" "esp-europe-to-asia" {
  name        = var.vpn-details.esp-name-asia
  ip_protocol = var.vpn-details.ip-protocol-esp
  ip_address  = google_compute_address.vpn-static-ip-to-asia.address
  target      = google_compute_vpn_gateway.to-asia-gateway.id
  region      = google_compute_subnetwork.task3-subnet-europe.region
}

# create an UDP 500 forwarding rule resource for VPN gateway to asia
resource "google_compute_forwarding_rule" "europe-to-asia_udp500" {
  name        = var.vpn-details.udp500-name-europe
  ip_protocol = var.vpn-details.ip-protocol-udp
  port_range  = var.vpn-details.port-range500
  ip_address  = google_compute_address.vpn-static-ip-to-asia.address
  target      = google_compute_vpn_gateway.to-asia-gateway.id
  region      = google_compute_subnetwork.task3-subnet-europe.region
}

# create an UDP 4500 forwarding rule resource for VPN gateway to asia
resource "google_compute_forwarding_rule" "europe-to-asia_udp4500" {
  name        = var.vpn-details.udp4500-name-europe
  ip_protocol = var.vpn-details.ip-protocol-udp
  port_range  = var.vpn-details.port-range4500
  ip_address  = google_compute_address.vpn-static-ip-to-asia.address
  target      = google_compute_vpn_gateway.to-asia-gateway.id
  region      = google_compute_subnetwork.task3-subnet-europe.region
}

# create a VPN tunnel resource for VPN gateway to asia
resource "google_compute_vpn_tunnel" "to-asia" {
  name                    = var.vpn-details.tunnel-name-asia
  peer_ip                 = google_compute_address.vpn-static-ip-to-europe.address
  shared_secret           = var.vpn-details.tunnel-shared-secret
  local_traffic_selector  = [google_compute_subnetwork.task3-subnet-europe.ip_cidr_range]
  remote_traffic_selector = [google_compute_subnetwork.task3-subnet-asia.ip_cidr_range]
  target_vpn_gateway      = google_compute_vpn_gateway.to-asia-gateway.id
  depends_on = [
    google_compute_forwarding_rule.esp-asia-to-europe,
    google_compute_forwarding_rule.asia-to-europe_udp500,
    google_compute_forwarding_rule.asia-to-europe_udp4500
  ]
}

# create a route resource for VPN gateway to asia
resource "google_compute_route" "europe-to-asia-route" {
  name                = var.vpn-details.route-name-asia
  network             = google_compute_network.task3-vpc-europe.name
  dest_range          = var.subnet-details.ip_cidr_range.asia
  next_hop_vpn_tunnel = google_compute_vpn_tunnel.to-asia.id
}