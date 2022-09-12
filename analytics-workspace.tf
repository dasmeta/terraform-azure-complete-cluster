resource "random_id" "log_analytics_workspace_name_suffix" {
  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "workspace" {
  # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
  name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
  location            = coalesce(var.log_analytics_workspace_resource_location, var.location)
  resource_group_name = coalesce(var.log_analytics_workspace_resource_group_name, var.resource_group_name)
  sku                 = var.log_analytics_workspace_sku

  depends_on = [azurerm_resource_group.rg]
}
