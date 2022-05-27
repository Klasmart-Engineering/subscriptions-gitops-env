variable "tools_cluster_tfc_sa_token" {
  description = "Token to access the Tools cluster for ArgoCD"
  type        = string
}

variable "ghcr_credentials" {
  description = "Registry credentials for k8s to pull application images"
  type        = string
}