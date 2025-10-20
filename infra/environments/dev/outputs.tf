# output "cluster_name" {
#     description = "GKE cluster name"
#     value       = module.gke.name
# }

output "cluster_endpoint" {
    description = "GKE cluster endpoint (API server IP/DNS)"
    value       = module.gke.endpoint
}

# output "cluster_ca_certificate" {
#     description = "Base64 encoded CA certificate for the cluster"
#     value       = module.gke.ca_certificate
# }

# output "kubeconfig" {
#     description = "Kubeconfig content for accessing the cluster"
#     value       = module.gke.kubeconfig
#     sensitive   = true
# }

output "cluster_name" {
    description = "GKE cluster Kubernetes version"
    value       = module.gke.cluster_name
}

output "node_pool_name" {
    description = "List of node pools created for the cluster"
    value       = module.gke.node_pool_name
}

# output "project_id" {
#     description = "GCP project where resources are created"
#     value       = module.gke.project_id
# }

# output "location" {
#     description = "GKE cluster location (region or zone)"
#     value       = module.gke.location
# }

output "service_account_email" {
    description = "Service account email used by the cluster / node pools"
    value       = try(module.gke.service_account_email, "")
}

# output "network_name" {
#     description = "VPC network name used by the cluster"
#     value       = module.network.name
# }

# output "subnet_name" {
#     description = "Subnet name used by the cluster"
#     value       = module.network.subnet_name
# }

# output "subnet_cidr" {
#     description = "CIDR range of the subnet"
#     value       = module.network.subnet_cidr
# }
