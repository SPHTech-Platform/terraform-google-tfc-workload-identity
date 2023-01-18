variable "project" {
  description = "GCP Project ID"
  type        = string
  default     = null
}

variable "workload_identity_pool_id" {
  description = "Workload Identity Pool ID"
  type        = string
  default     = "terraform-cloud"
}

variable "workload_identity_pool_display_name" {
  description = "Display name of TFC Workload Identity Pool"
  type        = string
  default     = "Terraform Cloud"
}

variable "workload_identity_pool_description" {
  description = "Description of the workload identity pool"
  type        = string
  default     = "Terraform Cloud Workload Identity"
}

variable "oidc_attributes_mapping" {
  description = "Maps attributes from authentication credentials issued by an external identity provider to Google Cloud attributes"
  type        = map(string)
  default = {
    "google.subject"                        = "assertion.sub",
    "attribute.aud"                         = "assertion.aud",
    "attribute.terraform_run_phase"         = "assertion.terraform_run_phase",
    "attribute.terraform_workspace_id"      = "assertion.terraform_workspace_id",
    "attribute.terraform_workspace_name"    = "assertion.terraform_workspace_name",
    "attribute.terraform_organization_id"   = "assertion.terraform_organization_id",
    "attribute.terraform_organization_name" = "assertion.terraform_organization_name",
    "attribute.terraform_run_id"            = "assertion.terraform_run_id",
    "attribute.terraform_full_workspace"    = "assertion.terraform_full_workspace",
  }
}

variable "allowed_audiences" {
  description = "List of allowwed audiences for the provider"
  type        = list(string)
  default     = ["tfc.workload.identity"]
}

variable "workspaces" {
  description = "Map of workspaces to allow access to. Workspace names are prefixes."
  type        = map(list(string))
}

variable "create_all_service_account" {
  description = "Create service account that allows all identities in the pool to impersonate"
  type        = bool
  default     = true
}

variable "service_account_id" {
  description = "Service Account ID"
  type        = string
  default     = "terraform-cloud"
}

variable "service_account_display_name" {
  description = "Display name of the service account"
  type        = string
  default     = "Terraform Cloud"
}

variable "service_account_description" {
  description = "Description of the service account"
  type        = string
  default     = "Used by Terraform Cloud"
}

variable "tfc_project_support_match" {
  description = "The key to use for Terraform Cloud Project matching in the subject key. This is to work around the module not support projects. You should set this to 'Default Project' or '*'"
  type        = string
  default     = "*"
}
