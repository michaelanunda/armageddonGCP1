# add compute instance to europe VPC
resource "google_compute_instance" "task3-europe" {
  name         = var.instance-details.name.europe
  machine_type = var.instance-details.machine_type
  zone         = var.instance-details.zone.europe

  boot_disk {
    initialize_params {
      image = var.instance-details.image.linux
      size  = var.instance-details.size.linux
    }
  }

  network_interface {
    network    = google_compute_network.task3-vpc-europe.name
    subnetwork = google_compute_subnetwork.task3-subnet-europe.name

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("${path.module}/scripts/startup.sh")
  tags                    = var.instance-details.tags.europe
  depends_on = [
    google_compute_network.task3-vpc-europe,
    google_compute_firewall.task3-firewall-rules-europe,
    google_compute_subnetwork.task3-subnet-europe,
    google_compute_network.task3-vpc-americas,
    google_compute_subnetwork.task3-subnet-iowa,
    google_compute_subnetwork.task3-subnet-oregon,
    google_compute_network_peering.peering1,
    google_compute_network_peering.peering2
  ]
}

# add compute instance to americas VPC
resource "google_compute_instance" "task3-americas-iowa" {
  name         = var.instance-details.name.americas1
  machine_type = var.instance-details.machine_type
  zone         = var.instance-details.zone.americas1

  boot_disk {
    initialize_params {
      image = var.instance-details.image.windows
      size  = var.instance-details.size.windows
      type  = var.instance-details.type
    }
  }

  network_interface {
    network    = google_compute_network.task3-vpc-americas.name
    subnetwork = google_compute_subnetwork.task3-subnet-iowa.name

    access_config {
      // Ephemeral public IP
    }
  }

  tags = var.instance-details.tags.americas1
  depends_on = [
    google_compute_network.task3-vpc-europe,
    google_compute_firewall.task3-firewall-rules-europe,
    google_compute_subnetwork.task3-subnet-europe,
    google_compute_network.task3-vpc-americas,
    google_compute_subnetwork.task3-subnet-iowa,
    google_compute_subnetwork.task3-subnet-oregon,
    google_compute_network_peering.peering1,
    google_compute_network_peering.peering2
  ]
}

# add compute instance to americas VPC
resource "google_compute_instance" "task3-americas-oregon" {
  name         = var.instance-details.name.americas2
  machine_type = var.instance-details.machine_type
  zone         = var.instance-details.zone.americas2

  boot_disk {
    initialize_params {
      image = var.instance-details.image.windows
      size  = var.instance-details.size.windows
      type  = var.instance-details.type
    }
  }

  network_interface {
    network    = google_compute_network.task3-vpc-americas.name
    subnetwork = google_compute_subnetwork.task3-subnet-oregon.name

    access_config {
      // Ephemeral public IP
    }
  }

  tags = var.instance-details.tags.americas2
  depends_on = [
    google_compute_network.task3-vpc-europe,
    google_compute_firewall.task3-firewall-rules-europe,
    google_compute_subnetwork.task3-subnet-europe,
    google_compute_network.task3-vpc-americas,
    google_compute_subnetwork.task3-subnet-iowa,
    google_compute_subnetwork.task3-subnet-oregon,
    google_compute_network_peering.peering1,
    google_compute_network_peering.peering2
  ]
}
/*
Personal Challenge: Create 2 VM's in the Americas with a image of type "debian-cloud/debian-12" and set their firewall ports to 22. From there, launch the website on the VM in Europe via the ssh tereminal of the VM's in the Americas.advanced_machine_features {
  Use the following links below:
  - https://manpages.debian.org/testing/sensible-utils/sensible-browser.1.en.html
  - https://www.google.com/search?q=sensible-browser+-+sensible+web+browsing&oq=sensible-browser+-+sensible+web+browsing&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBBzQyN2owajGoAgCwAgA&sourceid=chrome&ie=UTF-8
  - https://wiki.debian.org/DefaultWebBrowser#BROWSER_environment_variable
  - https://www.youtube.com/watch?v=Y6_7xaxkPik
  - https://superuser.com/questions/1503529/failed-to-execute-default-web-browser-input-output-error
  - https://stackoverflow.com/questions/60304251/unable-to-open-x-display-when-trying-to-run-google-chrome-on-centos-rhel-7-5
  - https://askubuntu.com/questions/613190/how-can-i-install-xfonts-packages
  - https://forums.debian.net/viewtopic.php?t=8614
  - https://askubuntu.com/questions/1109982/e-could-not-get-lock-var-lib-dpkg-lock-frontend-open-11-resource-temporari
  - Look at solution that Jay Remo worked through for Class 5.5 on Saturday 05/11/24
  - https://www.youtube.com/watch?v=sKXl7HW2hgk&list=PL9Tm5WqkVHXDZsj5tOndh0mWyN5iPU06t&index=98
}
  */

# add compute instance to asia VPC
resource "google_compute_instance" "task3-asia" {
  name         = var.instance-details.name.asia
  machine_type = var.instance-details.machine_type
  zone         = var.instance-details.zone.asia

  boot_disk {
    auto_delete = true
    initialize_params {
      image = var.instance-details.image.windows
      size  = var.instance-details.size.windows
      type  = var.instance-details.type
    }
  }

  network_interface {
    network    = google_compute_network.task3-vpc-asia.id
    subnetwork = google_compute_subnetwork.task3-subnet-asia.id

    access_config {
      // Ephemeral IP
    }
  }

  tags = var.instance-details.tags.asia
  depends_on = [
    google_compute_network.task3-vpc-europe,
    google_compute_firewall.task3-firewall-rules-europe,
    google_compute_subnetwork.task3-subnet-europe,
    google_compute_network.task3-vpc-americas,
    google_compute_subnetwork.task3-subnet-iowa,
    google_compute_subnetwork.task3-subnet-oregon,
    google_compute_network_peering.peering1,
    google_compute_network_peering.peering2
  ]
}
