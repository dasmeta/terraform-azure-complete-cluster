variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "Resource location in Azure"
}

variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "acr_name" {
  type        = string
  description = "ACR name"
}

variable "role_definition_name" {
  type    = string
  default = "AcrPull"
}

variable "skip_service_principal_aad_check" {
  type    = bool
  default = true
}

variable "virtual_network_name" {
  type    = string
  default = "example-network"
}

variable "address_space" {
  type    = list(string)
  default = ["10.254.0.0/16"]
}

variable "address_prefixes_1" {
  type    = list(string)
  default = ["10.254.0.0/24"]
}

variable "address_prefixes_2" {
  type    = list(string)
  default = ["10.254.2.0/24"]
}

variable "public_ip_name" {
  type    = string
  default = "example-pip"
}

variable "app_gw_name" {
  type    = string
  default = "example-appgateway"
}
