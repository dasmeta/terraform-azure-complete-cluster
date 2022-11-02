module "rbac" {

  count = var.aad_rbac ? 1 : 0

  depends_on = [azurerm_kubernetes_cluster.aks]
  source     = "./modules/rbac"

  admin_group_name = var.admin_group_name
  aks_cluster_name = azurerm_kubernetes_cluster.aks.name
  resource_group   = azurerm_kubernetes_cluster.aks.resource_group_name

  roles    = local.roles
  bindings = local.bindings
}

locals {
  roles    = var.roles
  bindings = var.bindings
}
