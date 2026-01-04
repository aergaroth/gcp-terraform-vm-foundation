# Terraform State Bucket Bootstrap

This configuration bootstraps a Google Cloud Storage bucket used for Terraform remote state.

The bucket is created separately to avoid circular dependencies where Terraform would attempt to use a backend that does not yet exist.

## Scope
- GCS bucket for Terraform state
- Object versioning enabled

## Notes
- This configuration uses a local Terraform state
- It is executed once per project
