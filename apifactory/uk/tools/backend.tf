terraform {
  cloud {
    organization = "kidsloop-infrastructure"
    workspaces {
      name = "subscriptions-apifactory-uk"
    }
  }
}
