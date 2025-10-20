
resource "google_artifact_registry_repository" "docker_repo" {
    project       = var.project_id
    location      = var.region
    repository_id = var.repository_id
    description   = var.description
    format        = "DOCKER"
}

output "repository_full_path" {
    value = "${google_artifact_registry_repository.docker_repo.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker_repo.repository_id}"
}

output "repository" {
  value = var.repository_id
}

output "repository_location" {
  value = google_artifact_registry_repository.docker_repo.location
}
