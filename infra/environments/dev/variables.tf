// /home/ubuntu-dev/gcp-k8s-gitops-automation/infra/dev/variables.tf
// Common variables for the "dev" environment GCP + GKE + GitOps setup

variable "project_id" {
    description = "GCP project id to deploy into"
    type        = string
}

variable "region" {
    description = "GCP region"
    type        = string
    default     = "us-central1"
}

variable "zone" {
    description = "GCP zone (used for zonal resources)"
    type        = string
    default     = "us-central1-a"
}

variable "env" {
    description = "Environment name (used in names/tags/labels)"
    type        = string
    default     = "dev"
}

variable "network_name" {
    description = "VPC network name"
    type        = string
    default     = "gke-network"
}

variable "subnet_name" {
    description = "Subnet name in the above VPC (must exist or be created)"
    type        = string
    default     = "gke-subnet"
}

variable "cluster_name" {
    description = "GKE cluster name"
    type        = string
    default     = "dev-cluster"
}

variable "cluster_version" {
    description = "GKE Kubernetes version. Use empty string for server default."
    type        = string
    default     = ""
}

variable "enable_private_cluster" {
    description = "Whether to create a private GKE cluster"
    type        = bool
    default     = false
}

variable "enable_workload_identity" {
    description = "Enable Workload Identity for the cluster"
    type        = bool
    default     = true
}

variable "initial_node_count" {
    description = "Initial node count for the default node pool"
    type        = number
    default     = 1
}

variable "node_machine_type" {
    description = "Machine type for nodes"
    type        = string
    default     = "e2-medium"
}

variable "node_disk_size_gb" {
    description = "Node disk size in GB"
    type        = number
    default     = 100
}

variable "node_pools" {
    description = <<-EOT
Optional map of additional node pools.
Example:
{
    pool-a = {
        name        = "pool-a"
        node_count  = 2
        machine_type = "e2-standard-4"
        preemptible = false
    }
}
EOT
    type = map(object({
        name         = string
        node_count   = number
        machine_type = string
        preemptible  = bool
    }))
    default = {}
}

variable "service_account_email" {
    description = "Workload / node service account email (optional). Leave empty to let Terraform manage SA."
    type        = string
    default     = ""
}

variable "gitops_repo" {
    description = "Git repository URL containing manifests/Helm charts for GitOps (ArgoCD / Flux)"
    type        = string
}

variable "gitops_branch" {
    description = "Branch to track in the GitOps repository"
    type        = string
    default     = "main"
}

variable "gitops_path" {
    description = "Path inside the Git repository for this environment's manifests"
    type        = string
    default     = "./clusters/dev"
}

variable "argocd_admin_password" {
    description = "Optional ArgoCD admin password (sensitive). Prefer using a secret manager."
    type        = string
    sensitive   = true
    default     = ""
}

variable "labels" {
    description = "Common labels to apply to resources"
    type        = map(string)
    default     = {
        environment = "dev"
        owner       = "dev-team"
    }
}