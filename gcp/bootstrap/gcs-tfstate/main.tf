provider "google" {
  project = var.project_id
}

resource "google_storage_bucket" "tfstate" {
  name     = var.bucket_name
  location = var.location

  versioning {
    enabled = true
  }

  force_destroy = false
}
