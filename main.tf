resource "google_project_service" "required" {
  for_each = toset([
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "sts.googleapis.com",
    "iamcredentials.googleapis.com",
  ])

  disable_on_destroy = false
  service            = each.key
  project            = var.project
}

resource "google_iam_workload_identity_pool" "tfc" {
  depends_on = [
    google_project_service.required,
  ]

  workload_identity_pool_id = var.workload_identity_pool_id
  display_name              = var.workload_identity_pool_display_name
  description               = var.workload_identity_pool_description
  project                   = var.project
}

resource "google_iam_workload_identity_pool_provider" "workspaces" {
  for_each = local.workspaces

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfc.workload_identity_pool_id
  workload_identity_pool_provider_id = each.key

  display_name = local.display_name[each.key]
  description  = "Organisation: ${each.value.org} Workspace: ${each.value.ws}"
  project      = var.project

  attribute_mapping   = var.oidc_attributes_mapping
  attribute_condition = "assertion.sub.startsWith(\"organization:${each.value.org}:project:${each.value.proj}:workspace:${each.value.ws}\")"

  oidc {
    issuer_uri        = "https://app.terraform.io"
    allowed_audiences = var.allowed_audiences
  }
}

resource "google_service_account" "tfc" {
  count = var.create_all_service_account ? 1 : 0
  depends_on = [
    google_project_service.required,
  ]

  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  description  = var.service_account_description
  project      = var.project
}

resource "google_service_account_iam_member" "all" {
  count = var.create_all_service_account ? 1 : 0

  service_account_id = google_service_account.tfc[0].name
  role               = "roles/iam.workloadIdentityUser"
  member             = "${local.pool_principal_base}/*"
}
