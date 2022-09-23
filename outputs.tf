output "workload_identity_pool_id" {
  description = "Workload Identity Pool ID"
  value       = google_iam_workload_identity_pool.tfc.workload_identity_pool_id
}

output "workload_identity_pool_principal_base" {
  description = "Base URI of the workload identity pool principal"
  value       = "principal://iam.googleapis.com/projects/${data.google_project.this.number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.tfc.workload_identity_pool_id}"
}

output "workload_identity_pool_principalset_base" {
  description = "Base URI of the workload identity pool principalset"
  value       = local.pool_principal_base
}

output "workload_identity_pool_providers" {
  description = "Workload Identity Pool Providers"
  value       = google_iam_workload_identity_pool_provider.workspaces
}

output "service_account_email" {
  description = "Email of the service account created to allow all identities in the pool to impersonate"
  value       = var.create_all_service_account ? google_service_account.tfc[0].email : null
}

output "service_account_name" {
  description = "Name of the service account created to allow all identities in the pool to impersonate"
  value       = var.create_all_service_account ? google_service_account.tfc[0].name : null
}

output "project_number" {
  description = "GCP Project Number"
  value       = data.google_project.this.number
}
