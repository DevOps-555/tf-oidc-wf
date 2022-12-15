resource "google_secret_manager_secret" "secret-basic" {

    project      = var.gcp_project
    secret_id    = "my-secret"

    labels = {
    label = "my-secret-lb"
    }

        replication {
        user_managed {
            replicas {
            location = "us-central1"
            }
            replicas {
            location = "us-east1"
            }
        }
    }
}
