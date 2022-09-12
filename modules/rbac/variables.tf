variable "resource_group" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "admin_group_name" {
  type = string
}

variable "bindings" {
  type = list(object({
    group     = string
    namespace = string
    roles = list(string)
  }))
}


variable "roles" {
  type = list(object({
    actions    = list(string)
    resources = list(string)

  }))
}
