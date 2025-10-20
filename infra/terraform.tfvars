project_id = "my-gcp-project"
region = "us-central1"
zone = "us-central1-a"
cluster_name = "gitops-cluster"
cluster_version = "1.26"
node_count = 3
machine_type = "e2-standard-4"
network = "default"
subnetwork = "default"

# service account to impersonate via Workload Identity Federation
service_account_email = "my-service-account@my-gcp-project.iam.gserviceaccount.com"

# Git repo for GitOps
git_repo_url = "git@github.com:your-org/your-repo.git"
git_branch = "main"
gitops_namespace = "argocd"

# Use Workload Identity Federation instead of a JSON key file
use_workload_identity = true
# Replace with your provider resource name:
# "projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/POOL/providers/PROVIDER"
workload_identity_provider = "projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/POOL/providers/PROVIDER"
