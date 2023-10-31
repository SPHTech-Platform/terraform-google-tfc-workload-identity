locals {
  flattened_workspaces = merge(flatten([for org, project in var.workspaces :
    [for proj, workspace in project : { for ws in workspace : "${org}-${proj}-${ws}" => {
      org  = org
      proj = proj
      ws   = ws
      }
    }]
  ])...)

  workspaces = { for k, ws in local.flattened_workspaces : length(k) > 32 ? join("-", [substr(k, 0, 23), substr(sha512(k), 0, 8)]) : k => ws }

  display_name_raw        = { for k, ws in local.workspaces : k => join("/", [ws.org, ws.proj, ws.ws]) }
  display_name_raw_sha512 = { for k, name in local.display_name_raw : k => sha512(name) }
  display_name            = { for k, name in local.display_name_raw : k => length(name) > 32 ? join("-", [substr(name, 0, 23), substr(local.display_name_raw_sha512[k], 0, 8)]) : name }

  # See https://cloud.google.com/iam/docs/workload-identity-federation#impersonation
  pool_principal_base = "principalSet://iam.googleapis.com/projects/${data.google_project.this.number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.tfc.workload_identity_pool_id}"
}

data "google_project" "this" {
  project_id = var.project
}
