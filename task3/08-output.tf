output "architecture-details" {
  value = <<-EOT
  ID for VPC in Europe: ${google_compute_network.task3-vpc-europe.id}
  ID for VPC in Americas: ${google_compute_network.task3-vpc-americas.id}
  ID for VPC in Asia: ${google_compute_network.task3-vpc-asia.id}

  ID for VPC Peering 1: ${google_compute_network_peering.peering1.id}
  ID for VPC Peering 2: ${google_compute_network_peering.peering2.id}

  Public IP of VM in Europe: ${google_compute_instance.task3-europe.network_interface.0.access_config.0.nat_ip}
  Internal IP of VM in Europe: ${google_compute_instance.task3-europe.network_interface.0.network_ip}

  Public IP of VM in Americas 1: ${google_compute_instance.task3-americas-iowa.network_interface.0.access_config.0.nat_ip}
  Internal IP of VM in Americas 1: ${google_compute_instance.task3-americas-iowa.network_interface.0.network_ip}

  Public IP of VM in Americas 2: ${google_compute_instance.task3-americas-oregon.network_interface.0.access_config.0.nat_ip}
  Internal IP of VM in Americas 2: ${google_compute_instance.task3-americas-oregon.network_interface.0.network_ip}

  Public IP of VM in Asia: ${google_compute_instance.task3-asia.network_interface.0.access_config.0.nat_ip}
  Internal IP of VM in Asia: ${google_compute_instance.task3-asia.network_interface.0.network_ip}

  VPN Gateway to Europe: ${google_compute_vpn_gateway.to-europe-gateway.id}
  VPN Gateway to Asia: ${google_compute_vpn_gateway.to-asia-gateway.id}
  EOT
}
