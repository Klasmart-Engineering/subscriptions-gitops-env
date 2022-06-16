moved {
  from = module.service_instance.argocd_application.istio
  to   = module.service_instance.argocd_application.applications["istio-config"]
}
moved {
  from = module.service_instance.argocd_application.microgateway
  to   = module.service_instance.argocd_application.applications["microgateway"]
}