variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "bucket_name" {
  description = "Name of the GCS bucket for Terraform remote state"
  type        = string
}

variable "location" {
  description = "Bucket location (e.g. EU, US)"
  type        = string
  default     = "EU"
}
