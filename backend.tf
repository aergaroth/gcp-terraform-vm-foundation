terraform {
  backend "gcs" {
    bucket  = "gcp-terraform-vm-foundation-tfstate"
    prefix  = "env/dev"
  }
}
