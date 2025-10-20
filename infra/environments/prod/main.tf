# module "gke" {
#   source = "../modules/gke"
#     project_id = var.project_id
#     region     = var.region
#     cluster_name = "gke-${terraform.workspace}"
# }

# module "storage" {
#   source = "../modules/storage"
#   buckert_name = "input-bucket-${terraform.workspace}"
# }

# module "cloud_function" {
#   source = "../modules/cloud-function"
#   bucket_trigger = module.storage.buckert_name
# }

# module "argocd" {
#   source = "../modules/argocd"
#     cluster_name = module.gke.cluster_name
# }