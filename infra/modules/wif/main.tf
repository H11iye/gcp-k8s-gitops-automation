resource "google_iam_workload_identity_pool" "github_pool" {
  workload_identity_pool_id = var.pool_id
  display_name = var.pool_display_name
  description  = "Workload Identity Pool for GitHub Actions"
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  # attach to the pool created above (use the same pool_id var used when creating the pool)
  workload_identity_pool_id = var.pool_id

  # required provider id (must be unique within the pool)
  workload_identity_pool_provider_id = "github-provider"

  display_name = "GitHub Actions OIDC provider"
  description  = "OIDC provider for GitHub Actions"

  oidc {
    issuer_uri        = "https://token.actions.githubusercontent.com"
    allowed_audiences = ["https://cloud.google.com/iam"]
  }

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
    "attribute.ref"        = "assertion.ref"
    "attribute.aud"        = "assertion.aud"
  }
}
resource "google_service_account" "ci_sa" {
  account_id   = var.ci_sa_account_id
  display_name = "CI Service Account for GitHub Actions"
}

# Allow the Workload Identity pool members to impersonate this SA.
# Use the provider resource name (more specific than the pool) and the SA resource "name" (canonical id).
resource "google_service_account_iam_binding" "allow_wif" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${google_service_account.ci_sa.email}"
  role               = "roles/iam.workloadIdentityUser"

  members = [
    # Restrict to the specific GitHub repository (owner/repo). This uses the provider full name so it's
    # scoped to the configured OIDC provider.
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool_provider.github_provider.name}/attribute.repository/${var.github_repo}"
  ]

  # Ensure the service account and provider exist before creating the binding.
  depends_on = [
    google_service_account.ci_sa,
    google_iam_workload_identity_pool.github_pool,
    google_iam_workload_identity_pool_provider.github_provider
  ]
}

# Grant essential roles to CI SA (minimally)
resource "google_project_iam_member" "artifact_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.ci_sa.email}"
}

resource "google_project_iam_member" "storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.ci_sa.email}"
}
