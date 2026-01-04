resource "google_service_account" "this" {
  account_id   = var.service_account_name
  display_name = "Compute service account"
  project      = var.project_id
}

# Minimal, safe default for VM access
resource "google_project_iam_member" "logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.this.email}"
}

resource "google_project_iam_member" "monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.this.email}"
}
