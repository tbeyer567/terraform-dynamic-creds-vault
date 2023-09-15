resource "vault_policy" "tfc" {
  name   = "tfc"
  policy = data.vault_policy_document.tfc
}

data "vault_policy_document" "tfc" {
  rule {
    description  = "Allow self lookup of tokens."
    path         = "auth/token/lookup-self"
    capabilities = ["read"]
  }

  rule {
    description  = "Allow token renewal."
    path         = "auth/token/renew-self"
    capabilities = ["update"]
  }

  rule {
    description  = "Allow token revocation."
    path         = "auth/token/revoke-self"
    capabilities = ["update"]
  }

  rule {
    description  = "Allow enumeration of mounts."
    path         = "sys/mounts"
    capabilities = ["list", "read"]
  }

  rule {
    description  = "Allow management of KV store mount."
    path         = "sys/mounts/kv-v2"
    capabilities = ["create", "read", "update", "delete", "patch", "list"]
  }

  rule {
    description  = "Allow access to KV store."
    path         = "kv-v2/*"
    capabilities = ["create", "read", "update", "delete", "patch", "list"]
  }
}