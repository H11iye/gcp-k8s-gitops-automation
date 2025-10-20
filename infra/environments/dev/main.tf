provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "gke" {
  source       = "../../modules/gke"
  project_id   = var.project_id
  region       = var.region
  zone         = var.zone
  cluster_name = var.cluster_name
  node_pool_name    = "primary-node-pool"
  cluster_location  = var.zone
  endpoint          = ""
  node_count   = 2
  min_node_count = 1
  max_node_count = 3
  machine_type = "e2-medium"
  disk_size_gb = 50
}

module "artifact" {
  source      = "../../modules/artifact_registry"
  project_id  = var.project_id
  region      = var.region
  repository_id = var.artifact_repo_id
}

module "wif" {
  source = "../../modules/wif"
  project_id = var.project_id
  pool_id = "github-pool-v2"
  provider_id = "github-provider"
  ci_sa_account_id = "ci-deploy-sa"
  github_repo = var.github_repo  # e.g. "owner/repo"
}

variable "artifact_repo_id" {
  type        = string
  description = "ID of the Artifact Registry repository used by the artifact module"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository in the form \"owner/repo\" used by the Workload Identity Federation module"
}
