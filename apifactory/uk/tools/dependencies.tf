data "tfe_outputs" "meta" {
  organization = local.terraform_organization
  workspace    = "meta-${local.infra_environment_directory}"
}

data "tfe_outputs" "account" {
  organization = local.terraform_organization
  workspace    = "account-${local.infra_environment_directory}"
}

data "tfe_outputs" "cluster" {
  organization = local.terraform_organization
  workspace    = "cluster-${local.infra_environment_directory}"
}

data "tfe_outputs" "common-infrastructure" {
  organization = local.terraform_organization
  workspace    = "subscriptions-common-infrastructure"
}

data "tfe_outputs" "cluster-infra-tools" {
  organization = local.terraform_organization
  workspace    = "cluster-infra-tools-prod"
}