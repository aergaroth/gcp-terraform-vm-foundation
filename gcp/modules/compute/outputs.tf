output "instance_public_ips" {
  value = {
    for name, inst in google_compute_instance.this :
    name => inst.network_interface[0].access_config[0].nat_ip
  }
}
