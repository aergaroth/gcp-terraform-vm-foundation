resource "google_compute_instance" "this" {
  for_each = var.instances

  name         = each.key
  machine_type = each.value.machine_type
  zone         = each.value.zone

  allow_stopping_for_update = true

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  network_interface {
    subnetwork = var.subnet
    access_config {}
  }

  tags = ["ssh"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
  # security hardening
  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }
}
