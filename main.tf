resource "vault_jwt_auth_backend" "tfc" {
  description        = "JWT auth for TFC dynamic creds"
  path               = var.jwt_backend_path
  oidc_discovery_url = "https://${var.tfc_hostname}"
  bound_issuer       = "https://${var.tfc_hostname}"
}

resource "vault_jwt_auth_backend_role" "tfc" {
  backend         = vault_jwt_auth_backend.tfc.path
  role_name       = "tfc"
  token_policies  = [vault_policy.tfc.name]
  bound_audiences = ["vault.workload.identity"]

  bound_claims_type = "glob"
  bound_claims = {
    sub = "organization:${var.tfc_org_name}:project:${var.tfc_project_name}:workspace:${var.tfc_workspace_name}:run_phase:*"
  }

  user_claim = "terraform_full_workspace"
  role_type  = "jwt"
  token_ttl  = 1200
}