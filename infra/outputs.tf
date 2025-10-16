output "cluster_name" {
  description = "Name of the GKE cluster"
  value       = module.gke.cluster_name
}

output "cluster_location" {
  description = "Zone or region of the cluster"
  value       = module.gke.cluster_location
}

output "node_pool_name" {
  description = "Primary node pool name"
  value       = module.gke.node_pool_name
}

output "kube_endpoint" {
  description = "GKE cluster endpoint (master endpoint)"
  value       = module.gke.endpoint
}
