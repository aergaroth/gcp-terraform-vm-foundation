terraform {
  backend "gcs" {
    bucket = "tfstate-gcp-vm-foundation-dev"
    prefix = "env/dev"
  }
}
