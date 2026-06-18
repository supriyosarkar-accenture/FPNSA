variable "resource_group_name" {
  description = "Resource group for Service Bus."
  type        = string
}

variable "location" {
  description = "Location for Service Bus namespace."
  type        = string
}

variable "namespace_name" {
  description = "Service Bus namespace name."
  type        = string
}

variable "queue_name" {
  description = "Service Bus queue name."
  type        = string
}
