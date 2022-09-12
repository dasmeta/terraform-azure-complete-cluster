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

module "roles" {
  source = "from some sorce that controlled by security specialist"
}

module "bindings" {
  source = "from some sorce that controlled by security specialist"
}
