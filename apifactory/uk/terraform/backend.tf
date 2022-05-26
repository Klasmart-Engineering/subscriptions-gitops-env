terraform {
  cloud {
    organization = "kidsloop-infrastructure"
    workspaces {
      name = local.tfe_workspace
    }
  }
}
