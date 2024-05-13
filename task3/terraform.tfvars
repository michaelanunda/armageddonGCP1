provider-details = {
  "project" = "useful-art-422022-m8"
  "region"  = "us-east1"
  "zone"    = "us-east1-b"
}

vpc-details = {
  name = {
    "europe"   = "task3-network-europe"
    "americas" = "task3-network-americas"
    "asia"     = "task3-network-asia"
  }
  auto_create_subnetworks = false
}

subnet-details = {
  name = {
    "europe"    = "task3-subnet-belgium"
    "americas1" = "task3-subnet-iowa"
    "americas2" = "task3-subnet-oregon"
    "asia"      = "task3-subnet-tokyo"
  }
  region = {
    "europe"    = "europe-west1"
    "americas1" = "us-central1"
    "americas2" = "us-west1"
    "asia"      = "asia-northeast1"
  }
  ip_cidr_range = {
    "europe"    = "10.178.0.0/24"
    "americas1" = "172.16.0.0/24"
    "americas2" = "172.16.32.0/24"
    "asia"      = "192.168.50.0/24"
  }
}

firewall-rules-details = {
  name = {
    "europe"   = "firewall-rule-europe"
    "americas" = "firewall-rule-americas"
    "asia"     = "firewall-rule-asia"
  }
  protocol = "tcp"
  ports = {
    "europe"   = ["80"]
    "americas" = ["3389"]
    "asia"     = ["3389"]
  }

  source_ranges = {
    "europe"   = ["172.16.0.0/24", "172.16.32.0/24", "192.168.50.0/24"]
    "americas" = ["0.0.0.0/0"]
    "asia"     = ["0.0.0.0/0"]
  }
}

peering-details = {
  "one" = "peering1"
  "two" = "peering2"
}

instance-details = {
  name = {
    "europe"    = "task3-instance-europe"
    "americas1" = "task3-instance-iowa"
    "americas2" = "task3-instance-oregon"
    "asia"      = "task3-instance-asia"
  }
  machine_type = "e2-medium"
  zone = {
    "europe"    = "europe-west1-c"
    "americas1" = "us-central1-a"
    "americas2" = "us-west1-a"
    "asia"      = "asia-northeast1-a"
  }
  image = {
    "linux"   = "debian-cloud/debian-12"
    "windows" = "projects/windows-cloud/global/images/windows-server-2022-dc-v20240415"
  }
  size = {
    "linux"   = 10
    "windows" = 120
  }
  type = "pd-balanced"
  tags = {
    "europe"    = ["http-server"]
    "americas1" = ["rdp-server"]
    "americas2" = ["rdp-server"]
    "asia"      = ["rdp-server"]
  }
}

vpn-details = {
  "gateway-name-europe"  = "to-europe-gateway"
  "gateway-name-asia"    = "to-asia-gateway"
  "static-name-europe"   = "vpn-static-ip-to-europe"
  "static-name-asia"     = "vpn-static-ip-to-asia"
  "esp-name-europe"      = "esp-asia-to-europe"
  "esp-name-asia"        = "esp-europe-to-asia"
  "ip-protocol-esp"      = "ESP"
  "udp500-name-asia"     = "asia-to-europe-udp500"
  "udp500-name-europe"   = "europe-to-asia-udp500"
  "port-range500"        = "500"
  "udp4500-name-asia"    = "asia-to-europe-udp4500"
  "udp4500-name-europe"  = "europe-to-asia-udp4500"
  "port-range4500"       = "4500"
  "ip-protocol-udp"      = "UDP"
  "tunnel-name-europe"   = "to-europe-gateway"
  "tunnel-name-asia"     = "to-asia-gateway"
  "tunnel-shared-secret" = "vigilance-lives"
  # pushing terraform.tfvars to your git repo is a bad security practice, line 110 being an example. Clean this up via .gitignore
  "route-name-europe" = "asia-to-europe-route"
  "route-name-asia"   = "europe-to-asia-route"
}