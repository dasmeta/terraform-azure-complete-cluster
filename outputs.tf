output "kube_admin_config" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config
}
