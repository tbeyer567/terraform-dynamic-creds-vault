variable "jwt_backend_path" {
  description = "The path in Vault to mount the JWT auth backend."
  default     = "jwt"
  type        = string
}

variable "tfc_hostname" {
  description = "Hostname of the TFC instance to be integrated with Vault."
  default     = "app.terraform.io"
  type        = string
}

variable "tfc_org_name" {
  description = "The name of the TFC organization."
  type        = string
}

variable "tfc_project_name" {
  description = "The project in which the workspace resides."
  type        = string
}

variable "tfc_workspace_name" {
  description = "The name of the workspace to be integrated with Vault."
  type        = string
}