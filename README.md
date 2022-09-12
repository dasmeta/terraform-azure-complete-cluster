This module creates AKS cluster and Node Pool in Azure and can create an Application Gateway if `ingress_application_gateway_enabled` is set true.

## Usage

```
module "aks-2" {
  source = "../terraform-azure-aks"

  resource_group_name = local.resource_group_name
  location            = local.location

  ingress_application_gateway_enabled = true
  ingress_application_gateway_name = "app-gw"
  ingress_application_gateway_subnet_cidr = "10.225.0.0/16"
  
  admin_group_name = "kubeadmin"
  aad_rbac = true

  roles = local.roles
  bindings = local.bindings
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_log_analytics_solution.solution](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [random_id.log_analytics_workspace_name_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The Admin Username for the Cluster. | `string` | `null` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | The DNS Prefix of the managed Kubernetes cluster. | `string` | `"aks"` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Specifies the type of Managed Service Identity that should be configured on this Kubernetes Cluster. | `string` | `"SystemAssigned"` | no |
| <a name="input_ingress_application_gateway_enabled"></a> [ingress\_application\_gateway\_enabled](#input\_ingress\_application\_gateway\_enabled) | Whether to deploy the Application Gateway ingress controller to this Kubernetes Cluster? | `bool` | `false` | no |
| <a name="input_ingress_application_gateway_id"></a> [ingress\_application\_gateway\_id](#input\_ingress\_application\_gateway\_id) | The ID of the Application Gateway to integrate with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_ingress_application_gateway_name"></a> [ingress\_application\_gateway\_name](#input\_ingress\_application\_gateway\_name) | The name of the Application Gateway to be used or created in the Nodepool Resource Group, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_ingress_application_gateway_subnet_cidr"></a> [ingress\_application\_gateway\_subnet\_cidr](#input\_ingress\_application\_gateway\_subnet\_cidr) | The subnet CIDR to be used to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_ingress_application_gateway_subnet_id"></a> [ingress\_application\_gateway\_subnet\_id](#input\_ingress\_application\_gateway\_subnet\_id) | The ID of the subnet on which to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_linux_profile"></a> [linux\_profile](#input\_linux\_profile) | admin\_username - The Admin Username for the Cluster. ssh\_key - An ssh\_key block. | <pre>object({<br>    admin_username = string<br>    ssh_key        = string<br>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Resource location in Azure. | `string` | `"West Europe"` | no |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Name of log analytics workspace. | `string` | `"analytics-workspace"` | no |
| <a name="input_log_analytics_workspace_resource_group_name"></a> [log\_analytics\_workspace\_resource\_group\_name](#input\_log\_analytics\_workspace\_resource\_group\_name) | Name of log analytics workspace resource group. It will be the same as cluster's resource group's name by default. | `string` | `null` | no |
| <a name="input_log_analytics_workspace_resource_location"></a> [log\_analytics\_workspace\_resource\_location](#input\_log\_analytics\_workspace\_resource\_location) | Location of log analytics workspace resource group. It will be the same as cluster's resource group's location by default. | `string` | `null` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | The SKU (pricing level) of the Log Analytics workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Used to specify the workload runtime. | `string` | `"System"` | no |
| <a name="input_name"></a> [name](#input\_name) | AKS name in Azure. | `string` | `"basic"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes which should exist in this Node Pool. | `number` | `1` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | The name which should be used for the default Kubernetes Node Pool. | `string` | `"agentpool"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure. | `string` | `"aks_tf_rg"` | no |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Is Role Based Access Control enabled for this managed Kubernetes Cluster. | `bool` | `false` | no |
| <a name="input_solution_name"></a> [solution\_name](#input\_solution\_name) | Specifies the name of the solution to be deployed. | `string` | `"ContainerInsights"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the Virtual Machine. | `string` | `"Standard_DS2_v2"` | no |
| <a name="input_workload_runtime"></a> [workload\_runtime](#input\_workload\_runtime) | Used to specify the workload runtime. | `string` | `"OCIContainer"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
