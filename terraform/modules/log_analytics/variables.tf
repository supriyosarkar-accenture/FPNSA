variable "resource_group_name" {
  description = "Resource group for Log Analytics workspace."
  type        = string
}

variable "location" {
  description = "Location for Log Analytics workspace."
  type        = string
}

variable "name" {
  description = "Log Analytics workspace name."
  type        = string
}
