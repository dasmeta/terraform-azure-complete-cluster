resource "azurerm_kubernetes_cluster_node_pool" "pool" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  mode                  = var.mode
  name                  = var.node_pool_name
  vm_size               = var.vm_size
  workload_runtime      = var.workload_runtime
  node_count            = var.node_count
}
