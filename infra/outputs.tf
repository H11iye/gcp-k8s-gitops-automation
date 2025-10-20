output "cluster_name" {
  description = "Name of the GKE cluster"
  value       = module.gke.cluster_name
}

output "cluster_location" {
  description = "Zone or region of the cluster"
  value       = module.gke.cluster_location
}

output "kube_endpoint" {
  description = "GKE API endpoint"
  value       = module.gke.endpoint
}

output "artifact_repository" {
  description = "Artifact Registry repository id"
  value       = module.artifact.repository
}

output "workload_identity_pool_name" {
  description = "Workload Identity Pool resource name"
  value       = module.wif.github_pool_name # if you add such an output in the wif module
}

output "ci_service_account_email" {
  description = "CI service account email"
  value       = module.wif.ci_sa_email
}
