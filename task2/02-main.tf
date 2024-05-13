# add compute instance to the VPC
resource "google_compute_instance" "task2-instance" {
  name         = var.instance-details.name
  machine_type = var.instance-details.machine_type
  zone         = var.provider-details.zone

  boot_disk {
    initialize_params {
      image = var.instance-details.image
      size  = var.instance-details.size
    }
  }

  network_interface {
    network    = google_compute_network.task2-vpc.name
    subnetwork = google_compute_subnetwork.task2-subnet.name

    access_config {
      // Ephemeral public IP
    }
  }
  
  metadata_startup_script = file("${path.module}/scripts/startup.sh")
  tags = var.instance-details.tags
}

