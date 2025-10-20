module "gke" {
  source = "./modules/gke"
    project_id = var.project_id
    region     = var.region
    cluster_name = "express-cluster"
}


