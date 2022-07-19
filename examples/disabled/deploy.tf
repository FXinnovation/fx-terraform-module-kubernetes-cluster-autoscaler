provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "this" {
  source = "../../"

  enabled       = false
  arguments     = []
  image_version = ""
}
