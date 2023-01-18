# Terraform Modules Template

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_iam_workload_identity_pool.tfc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.workspaces](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |
| [google_project_service.required](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.tfc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.all](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_audiences"></a> [allowed\_audiences](#input\_allowed\_audiences) | List of allowwed audiences for the provider | `list(string)` | <pre>[<br>  "tfc.workload.identity"<br>]</pre> | no |
| <a name="input_create_all_service_account"></a> [create\_all\_service\_account](#input\_create\_all\_service\_account) | Create service account that allows all identities in the pool to impersonate | `bool` | `true` | no |
| <a name="input_oidc_attributes_mapping"></a> [oidc\_attributes\_mapping](#input\_oidc\_attributes\_mapping) | Maps attributes from authentication credentials issued by an external identity provider to Google Cloud attributes | `map(string)` | <pre>{<br>  "attribute.aud": "assertion.aud",<br>  "attribute.terraform_full_workspace": "assertion.terraform_full_workspace",<br>  "attribute.terraform_organization_id": "assertion.terraform_organization_id",<br>  "attribute.terraform_organization_name": "assertion.terraform_organization_name",<br>  "attribute.terraform_run_id": "assertion.terraform_run_id",<br>  "attribute.terraform_run_phase": "assertion.terraform_run_phase",<br>  "attribute.terraform_workspace_id": "assertion.terraform_workspace_id",<br>  "attribute.terraform_workspace_name": "assertion.terraform_workspace_name",<br>  "google.subject": "assertion.sub"<br>}</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | GCP Project ID | `string` | `null` | no |
| <a name="input_service_account_description"></a> [service\_account\_description](#input\_service\_account\_description) | Description of the service account | `string` | `"Used by Terraform Cloud"` | no |
| <a name="input_service_account_display_name"></a> [service\_account\_display\_name](#input\_service\_account\_display\_name) | Display name of the service account | `string` | `"Terraform Cloud"` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | Service Account ID | `string` | `"terraform-cloud"` | no |
| <a name="input_workload_identity_pool_description"></a> [workload\_identity\_pool\_description](#input\_workload\_identity\_pool\_description) | Description of the workload identity pool | `string` | `"Terraform Cloud Workload Identity"` | no |
| <a name="input_workload_identity_pool_display_name"></a> [workload\_identity\_pool\_display\_name](#input\_workload\_identity\_pool\_display\_name) | Display name of TFC Workload Identity Pool | `string` | `"Terraform Cloud"` | no |
| <a name="input_workload_identity_pool_id"></a> [workload\_identity\_pool\_id](#input\_workload\_identity\_pool\_id) | Workload Identity Pool ID | `string` | `"terraform-cloud"` | no |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | Map of workspaces to allow access to. Workspace names are prefixes. | `map(list(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | GCP Project Number |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | Email of the service account created to allow all identities in the pool to impersonate |
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | Name of the service account created to allow all identities in the pool to impersonate |
| <a name="output_workload_identity_pool_id"></a> [workload\_identity\_pool\_id](#output\_workload\_identity\_pool\_id) | Workload Identity Pool ID |
| <a name="output_workload_identity_pool_principal_base"></a> [workload\_identity\_pool\_principal\_base](#output\_workload\_identity\_pool\_principal\_base) | Base URI of the workload identity pool principal |
| <a name="output_workload_identity_pool_principalset_base"></a> [workload\_identity\_pool\_principalset\_base](#output\_workload\_identity\_pool\_principalset\_base) | Base URI of the workload identity pool principalset |
| <a name="output_workload_identity_pool_providers"></a> [workload\_identity\_pool\_providers](#output\_workload\_identity\_pool\_providers) | Workload Identity Pool Providers |
<!-- END_TF_DOCS -->
