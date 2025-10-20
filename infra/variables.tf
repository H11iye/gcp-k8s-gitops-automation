variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone (for zonal clusters/node pools)"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "gke-terraform-cluster"
}

# variable "tf_state_bucket" {
#   description = "GCP bucket state"
#   type = string
#   default = "terraform-state-bucket"
# }

# Workload Identity / CI 
variable "github_repo" {
  description = "Github repo in the format owner/repo (used to restirct WIF)"
  type = string
  default = ""
}

variable "github_branch" {
  description = "Optional branch  restriction for WIF (e.g. refs/heads/main)"
  type = string
  default = "refs/heads/main"
}

# Artifact registry

variable "artifact_repo_id" {
  description = "Artifact Registry repository id (docker)"
  type = string
  default = "express-app-repo"
}