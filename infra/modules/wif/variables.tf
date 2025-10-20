variable "project_id" { type = string }
variable "pool_id" { 
    type = string
    default = "github-pool"
}
variable "pool_display_name" {
    type = string
    default = "GitHub Actions Pool"
  }
variable "provider_id" { 
    type = string 
    default = "github-provider" 
}
variable "provider_display_name" { 
    type = string
    default = "GitHub OIDC Provider" 
}
variable "ci_sa_account_id" { 
    type = string
    default = "ci-deploy-sa"
}
variable "github_repo" { type = string } # owner/repo
