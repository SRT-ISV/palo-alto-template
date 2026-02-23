variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default = ""
}

variable "tamplate_name" {
  description = "Template name"
  type        = string
  default     = ""

}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-west1"

}

variable "mgmt_subnet" {
  description = "Managemnet subnet"
  type        = string
  default     = ""

}

variable "data_subnet" {
  description = "Data subnet"
  type        = string
  default     = ""

}

variable "bucket_name" {
  description = "Bootstrap Bucket name"
  type        = string
  default     = ""

}

variable "service_account_email" {
  description = "Pass the Service account email to use"
  type        = string
  default     = ""

}

variable "mgmt_public_ip" {
  description = "If true, a public IP will be set on the management interface."
  type        = bool
  default     = false
}


variable "subnet_cidr_mgmt" {
  description = "The IPv4 CIDR for the management subnet."
  default     = "10.0.0.0/28"
  type        = string
}

variable "subnet_cidr_data" {
  description = "The IPv4 CIDR for the dataplane subnet."
  default     = "10.0.1.0/28"
  type        = string
}

variable "image_name" {
  description = "Name of the firewall image within the paloaltonetworksgcp-public project. To list available images, run: `gcloud compute images list --project paloaltonetworksgcp-public --no-standard-images`. If you are using a custom image in a different project, update `local.firewall_image_url` in `main.tf` to match your URL."
  default     = "vmseries-flex-bundle2-1126"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the firewalls (n2 or e2 recommended)."
  default     = "n2-standard-4"
  type        = string
}


variable "csp_pin_id_secret" {
  description = "The firewall registration PIN ID for installing the device certificate onto the firewall."
  default     = ""
  type        = string
}

variable "csp_pin_value_secret" {
  description = "The firewall registration PIN Value for installing the device certificate onto the firewall."
  default     = ""
  type        = string
}

variable "csp_authcodes_secret" {
  description = "(BYOL only) An authcode that is registered with your CSP account. "
  default     = ""
  type        = string
}



variable "roles" {
  description = "Roles to assign to the firewall's service account."
  default = [
    "roles/compute.networkViewer",
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/viewer",
    "roles/stackdriver.accounts.viewer",
    "roles/stackdriver.resourceMetadata.writer",
  ]
  type = set(string)
}

variable "metadata" {
  description = "Metadata for VM-Series firewall. The metadata is used to perform mgmt-interface-swap and for bootstrapping the VM-Series."
  type        = map(string)
  default     = {}
}
