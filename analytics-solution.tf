resource "azurerm_log_analytics_solution" "solution" {
  solution_name         = var.solution_name
  location              = azurerm_log_analytics_workspace.workspace.location
  resource_group_name   = azurerm_log_analytics_workspace.workspace.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
  workspace_name        = azurerm_log_analytics_workspace.workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
