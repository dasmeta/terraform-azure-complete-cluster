resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  dns_prefix                        = var.dns_prefix
  location                          = azurerm_resource_group.rg.location
  name                              = var.name
  resource_group_name               = azurerm_resource_group.rg.name
  role_based_access_control_enabled = var.aad_rbac

  azure_active_directory_role_based_access_control {
    managed = true
    azure_rbac_enabled = false
    admin_group_object_ids = [data.azuread_group.ad_group.id]
  }

  default_node_pool {
    name       = var.node_pool_name
    vm_size    = var.vm_size
    node_count = var.node_count
  }

  identity {
    type = var.identity_type
  }



  dynamic "ingress_application_gateway" {
    for_each = var.ingress_application_gateway_enabled ? ["ingress_application_gateway"] : []

    content {
      gateway_id   = var.ingress_application_gateway_id
      gateway_name = var.ingress_application_gateway_name
      subnet_cidr  = var.ingress_application_gateway_subnet_cidr
      subnet_id    = var.ingress_application_gateway_subnet_id
    }
  }

  dynamic "linux_profile" {
    for_each = var.admin_username == null ? [] : [var.admin_username]

    content {
      admin_username = linux_profile.value.admin_username
      ssh_key {
        key_data = linux_profile.value.ssh_key
      }
    }
  }
}

data "azuread_group" "ad_group" {

  display_name     = var.admin_group_name
  security_enabled = true

}
