variable "provider-details" {
  description = "Provider details for resource deployment"
  type        = map(string)
}

variable "vpc-details" {
  description = "Details for google compute network resource blocks"
  type = object({
    name                    = map(string)
    auto_create_subnetworks = bool
  })
}

variable "subnet-details" {
  description = "Details for google compute subnetwork resource blocks"
  type = object({
    name          = map(string)
    region        = map(string)
    ip_cidr_range = map(string)
  })
}

variable "firewall-rules-details" {
  description = "Details for google compute firewall resource blocks"
  type = object({
    name          = map(string)
    protocol      = string
    ports         = map(set(string))
    source_ranges = map(set(string))
  })
}

variable "peering-details" {
  description = "Details for google compute network peering resource blocks"
  type        = map(string)
}

variable "instance-details" {
  description = "Details for google compute instance resource blocks"
  type = object({
    name         = map(string)
    machine_type = string
    zone         = map(string)
    image        = map(string)
    size         = map(number)
    type         = string
    tags         = map(set(string))
  })
}

variable "vpn-details" {
  description = "Details for all resource blocks associated with VPN gateway connection to europe VPC and asia VPC"
  type        = map(string)
}

# variable "credentials" {
#   type        = string
#   description = "The path to the service account key file"
#   default     = "iamagwe-40a98105e9fd.json"
# }
# gcloud cli auth replaces lines XX-XX