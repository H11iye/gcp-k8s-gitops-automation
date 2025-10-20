variable "cluster_location" {
  description = "GKE cluster location (region or zone)"
  type        = string
}

variable "endpoint" {
  description = "GKE cluster endpoint"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
}

output "cluster_name" {
  value = var.cluster_name
}

output "cluster_location" {
  value = var.cluster_location
}

output "endpoint" {
  value = var.endpoint
}

output "node_pool_name" {
  value = var.node_pool_name
}
