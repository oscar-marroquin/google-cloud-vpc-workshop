##################################################################################
# Required GCP VPC API's
##################################################################################

resource "google_project_service" "services_enabled_project" {
  for_each = toset([
    "servicenetworking.googleapis.com",
    "dns.googleapis.com"
  ])

  service            = each.key
  project            = var.project
  disable_on_destroy = false
}