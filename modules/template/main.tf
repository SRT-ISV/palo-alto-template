// Create instance template for the firewall
resource "google_compute_instance_template" "main" {
  name             = var.tamplate_name
  project          = var.project_id
  machine_type     = var.machine_type
  min_cpu_platform = "Intel Cascade Lake"
  tags             = ["panw-tutorial"]
  can_ip_forward   = true

  metadata = {
    type                                  = "dhcp-client"
    dhcp-send-client-id                   = "yes"
    dhcp-accept-server-hostname           = "yes"
    dhcp-accept-server-domain             = "yes"
    vm-series-auto-registration-pin-id    = var.csp_pin_id_secret
    vm-series-auto-registration-pin-value = var.csp_pin_value_secret
    authcodes                             = var.csp_authcodes_secret
    dns-primary                           = "169.254.169.254"
    vmseries-bootstrap-gce-storagebucket  = var.bucket_name
  }

  network_interface {
    subnetwork = var.mgmt_subnet
    dynamic "access_config" {
      for_each = var.mgmt_public_ip ? [1] : []
      content {}
    }
  }

  network_interface {
    subnetwork = var.data_subnet

  }

  disk {
    source_image = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/${var.image_name}"
    disk_type    = "pd-ssd"
    auto_delete  = true
    boot         = true
  }

  lifecycle {
    create_before_destroy = true
  }

  service_account {
    email = var.service_account_email
    scopes = [
      "https://www.googleapis.com/auth/compute.readonly",
      "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
    ]
  }
}
