variable "provider-details" {
  description = "Provider details for resource deployment"
  type        = map(string)
}

variable "vpc-details" {
  description = "Details for google compute network resource block"
  type = object({
    name                    = string
    auto_create_subnetworks = bool
  })
}

variable "subnet-details" {
  description = "Details for google compute subnetwork resource block"
  type        = map(string)
}

variable "firewall-rules-details" {
  description = "Details for google compute firewall resource block"
  type = object({
    name          = string
    protocol      = string
    ports         = set(string)
    source_ranges = set(string)
  })
}

variable "instance-details" {
  description = "Details for google compute instance resource block"
  type = object({
    name         = string
    machine_type = string
    image        = string
    size         = number
    tags         = set(string)
  })
}

# variable "credentials" {
#   type        = string
#   description = "The path to the service account key file"
#   default     = "iamagwe-40a98105e9fd.json"
# }
# gcloud cli auth replaces lines 41-45