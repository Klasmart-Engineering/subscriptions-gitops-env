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



resource "kubernetes_namespace" "product" {
  metadata {
# TODO: Take the labels from the controller module output = they contain istio.io/rev for managing istio version
    name = var.product_namespace
  }
}
