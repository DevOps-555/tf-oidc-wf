resource "google_service_account" "runner_sa" {
  project      = var.gcp_project
  account_id   = "tf-gh-runner"
  display_name = "tf-sa"
  description = "terraform test project using gh runner"
}

data "google_project" "project" {
  project_id = var.gcp_project
}

data "google_iam_policy" "wli_user_ghshr" {
  binding {
    role = "roles/iam.workloadIdentityUser"

    members = [
      "principalSet://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/gh-pool/attribute.full/${var.gh_repo}${var.gh_branch}",
    ]
  }
}

resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = google_service_account.runner_sa.name
  policy_data        = data.google_iam_policy.wli_user_ghshr.policy_data
}