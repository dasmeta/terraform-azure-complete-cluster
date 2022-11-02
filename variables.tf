
variable "resource_group_name" {
  type        = string
  default     = "aks_tf_rg1"
  description = "RG name in Azure."
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Resource location in Azure."
}

variable "dns_prefix" {
  type        = string
  default     = "aks"
  description = "The DNS Prefix of the managed Kubernetes cluster."
}

variable "name" {
  type        = string
  default     = "basic"
  description = "AKS name in Azure."
}

#variable "role_based_access_control_enabled" {
#  type        = bool
#  default     = false
#  description = "Is Role Based Access Control enabled for this managed Kubernetes Cluster."
#}

variable "node_pool_name" {
  type        = string
  default     = "agentpool"
  description = "The name which should be used for the default Kubernetes Node Pool."
}

variable "vm_size" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "The size of the Virtual Machine."
}

variable "node_count" {
  type        = number
  default     = 1
  description = "The number of nodes which should exist in this Node Pool."
}

variable "identity_type" {
  type        = string
  default     = "SystemAssigned"
  description = "Specifies the type of Managed Service Identity that should be configured on this Kubernetes Cluster."
}

variable "admin_username" {
  type        = string
  default     = null
  description = "The Admin Username for the Cluster."
}

variable "linux_profile" {
  type = object({
    admin_username = string
    ssh_key        = string
  })
  default     = null
  description = "admin_username - The Admin Username for the Cluster. ssh_key - An ssh_key block."
}

variable "workload_runtime" {
  type        = string
  default     = "OCIContainer"
  description = "Used to specify the workload runtime."
}

variable "mode" {
  type        = string
  default     = "System"
  description = "Used to specify the workload runtime."
}

variable "ingress_application_gateway_enabled" {
  type        = bool
  default     = false
  description = "Whether to deploy the Application Gateway ingress controller to this Kubernetes Cluster?"
}

variable "ingress_application_gateway_id" {
  type        = string
  default     = null
  description = "The ID of the Application Gateway to integrate with the ingress controller of this Kubernetes Cluster."
}

variable "ingress_application_gateway_name" {
  type        = string
  default     = null
  description = "The name of the Application Gateway to be used or created in the Nodepool Resource Group, which in turn will be integrated with the ingress controller of this Kubernetes Cluster."
}

variable "ingress_application_gateway_subnet_cidr" {
  type        = string
  default     = null
  description = "The subnet CIDR to be used to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster."
}

variable "ingress_application_gateway_subnet_id" {
  type        = string
  default     = null
  description = "The ID of the subnet on which to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster."
}

variable "log_analytics_workspace_name" {
  type        = string
  default     = "analytics-workspace"
  description = "Name of log analytics workspace."
}
variable "log_analytics_workspace_resource_location" {
  type        = string
  default     = null
  description = "Location of log analytics workspace resource group. It will be the same as cluster's resource group's location by default."
}

variable "log_analytics_workspace_resource_group_name" {
  type        = string
  default     = null
  description = "Name of log analytics workspace resource group. It will be the same as cluster's resource group's name by default."
}

variable "log_analytics_workspace_sku" {
  type        = string
  default     = "PerGB2018"
  description = "The SKU (pricing level) of the Log Analytics workspace."
}

variable "solution_name" {
  type        = string
  default     = "ContainerInsights"
  description = "Specifies the name of the solution to be deployed."
}

variable "aad_rbac" {
  type    = bool
  default = false
}

variable "admin_group_name" {
  default = null
  type    = string
}

variable "bindings" {
  type = list(object({
    group     = string
    namespace = string
    roles     = list(string)
  }))
  default = []
}


variable "roles" {
  type = list(object({
    actions   = list(string)
    resources = list(string)
  }))
  default = []
}
