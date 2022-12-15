module "gcp-wlif" {
  source = "./tf-wlif"

  gcp_project = var.gcp_project
}

module "gcp-sa" {
  source = "./tf-sa"

  gcp_project = var.gcp_project
  gh_branch = var.gh_branch
  gh_repo = var.gh_repo
}

module "gcp-secrets" {
  source = "./tf-secret"

  gcp_project = var.gcp_project

}