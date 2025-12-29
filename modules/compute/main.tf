resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["ssh"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = var.subnet

    access_config {} # ephemeral public IP (dev only)
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

#   metadata = {
#     ssh-keys = "${var.ssh_username}:${var.ssh_public_key}"
#   }

  metadata = {
    enable-oslogin = "TRUE"
  }


}
