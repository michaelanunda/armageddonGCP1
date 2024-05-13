provider-details = {
  "project" = "useful-art-422022-m8"
  "region"  = "us-east1"
  "zone"    = "us-east1-b"
}

vpc-details = {
  name                    = "task2-network"
  auto_create_subnetworks = false
}

subnet-details = {
  "name"          = "task2-subnet"
  "ip_cidr_range" = "10.178.0.0/24"
}

firewall-rules-details = {
  "name"          = "firewall-rule"
  "protocol"      = "tcp"
  "ports"         = ["80", "443", "22"]
  "source_ranges" = ["0.0.0.0/0"]
}

instance-details = {
  "name"         = "task2-instance"
  "machine_type" = "e2-medium"
  "image"        = "debian-cloud/debian-12"
  "size"         = 10
  "tags"         = ["http-server"]
}