##################################################################################
# Required GCP VPC API's
##################################################################################

resource "google_project_service" "services_enabled_project" {
  for_each = toset([
    "compute.googleapis.com",
    "servicenetworking.googleapis.com"
  ])

  service            = each.key
  project            = var.project
  disable_on_destroy = false
}