provider "kubernetes" {
  version = "<= 1.9.0"
  load_config_file = false
  host             = var.host
  token = var.token
  alias = "public"

  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}
