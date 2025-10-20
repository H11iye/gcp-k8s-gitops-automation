locals {
  location = var.zone != "" ? var.zone : var.region
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = local.location

  remove_default_node_pool = true
  initial_node_count      = 1

  release_channel {
    channel = "REGULAR"  # stable balance of features & safety. See GKE release channels docs.
  }

  ip_allocation_policy {} # enable VPC-native (recommended)

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-pool"
  location = local.location
  cluster  = var.cluster_name

  initial_node_count = var.node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }
}
