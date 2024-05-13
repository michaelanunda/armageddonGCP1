output "architecture-details" {
  value = <<-EOT
  ID for VPC of VM: ${google_compute_network.task2-vpc.id}
  ID for Subnet of VM: ${google_compute_subnetwork.task2-subnet.id}
  Public IP of VM: ${google_compute_instance.task2-instance.network_interface.0.access_config.0.nat_ip}
  Internal IP of VM: ${google_compute_instance.task2-instance.network_interface.0.network_ip}
  EOT
}

