locals {
  workspaces = merge(
    [for org, workspaces in var.workspaces : { for ws in workspaces : "${org}-${ws}" => { org = org, ws = ws } }]...
  )

  # See https://cloud.google.com/iam/docs/workload-identity-federation#impersonation
  pool_principal_base = "principalSet://iam.googleapis.com/projects/${data.google_project.this.number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.tfc.workload_identity_pool_id}"
}

data "google_project" "this" {
  project_id = var.project
}
