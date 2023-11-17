# resource "google_service_account" "service_a" {
#   account_id = "service-a"
# }

# resource "google_project_iam_member" "service_a" {
#   project = var.project_id
#   role = "roles/storage.admin"
#   member = "serviceAccount:${google_service_account.service_a.email}"
# }

# resource "google_service_account_iam_member" "service_a" {
#   service_account_id = google_service_account.service_a.id
#   role = "roles/iam.workloadIdentityUser"
#   member = "serviceAccount:${var.project_id}.svc.id.goog[staging-service-a]"
# }