# Example backend configuration (for reference only).
# Actual values must be provided during `terraform init`.

# terraform {
#   backend "gcs" {
#     bucket  = "tfstate-gcp-vm-foundation-dev"
#     prefix = "env/dev"
#   }
# }

terraform {
  backend "gcs" {}
}
