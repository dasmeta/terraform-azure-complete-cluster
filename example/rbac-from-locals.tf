#Example usage
module "azure-complete-cluster" {
  source = "../azure-repo/terraform-azure-complete-cluster"
  admin_group_name = "kubeadmin"
  aad_rbac = true

  roles = local.roles
  bindings = local.bindings
}

#Provider Configuration
provider "kubernetes" {
  host                   = module.azure-complete-cluster.kube_admin_config.0.host
  client_certificate     = base64decode(module.azure-complete-cluster.kube_admin_config.0.client_certificate)
  client_key             = base64decode(module.azure-complete-cluster.kube_admin_config.0.client_key)
  cluster_ca_certificate = base64decode(module.azure-complete-cluster.kube_admin_config.0.cluster_ca_certificate)
}

locals {

  roles = [{
    name      = "viewers"
    actions   = ["get", "list", "watch"]
    resources = ["deployments"]
  }, {
    name      = "editors"
    actions   = ["get", "list", "watch"]
    resources = ["pods"]
  }]

  bindings = [{
    group     = "developers"
    namespace = "development"
    roles     = ["viewers", "editors"]

  }, {
    group     = "accountants"
    namespace = "accounting"
    roles     = ["editors"]
  },
    {
      group     = "developers"
      namespace = "accounting"
      roles     = ["viewers"]
    }
  ]
}
