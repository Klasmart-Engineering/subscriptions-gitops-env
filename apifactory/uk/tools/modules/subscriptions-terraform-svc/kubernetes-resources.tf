# data service database password secret
/* resource "kubernetes_secret" "data_db" {
  metadata {
    name      = "data-service-db"
    namespace = var.data_service_namespace
  }

  data = {
    dataname = local.data_service_master_dataname
    password = local.data_service_db_password
    hostname = local.data_service_endpoint
    db_port  = local.data_service_db_port
    db_name  = local.data_service_db_name
  }
} */
// Inject Secrets & Configuration Variables into kubernetes via secrets & config maps


# TODO: Rename this to produce
resource "kubernetes_namespace" "offering" {
  metadata {
    name = var.product_namespace
  }
}

# Create secret to allow kubernetes to access terraform cloud
resource "kubernetes_secret" "tfc-token" {
  metadata {
    name = "terraformrc"
    namespace = var.product_namespace
  }

  data = {
    "credentials" = "credentials app.terraform.io {token = \"${var.tfe_access_token}\"}"
  }
  type = "Opaque"
}


# Create secret to populate tfc workspaces created by the operator with sensitive values
resource "kubernetes_secret" "tfc-workspace" {
  metadata {
    name = "workspacesecrets"
    namespace = var.product_namespace
  }

  data = {
    aws_target_role_arn = var.aws_target_role_arn
    aws_session_name = var.aws_session_name
    aws_target_external_id  = var.aws_target_external_id
  }
  type = "Opaque"
}


# Create secret to allow kubernetes access to the Container Registry
resource "kubernetes_secret" "container-registry-secret" {
  metadata {
    name = "dockerconfigjson-ghcr"
    namespace = var.product_namespace
  }

  data = {
    ".dockerconfigjson" = var.container_registry_credentials
  }

  type = "kubernetes.io/dockerconfigjson"
}
