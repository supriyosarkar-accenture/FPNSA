variable "resource_group_name" {
  description = "Resource group for Event Grid resources."
  type        = string
}

variable "location" {
  description = "Location for Event Grid resources."
  type        = string
}

variable "storage_account_id" {
  description = "Resource ID of the storage account to monitor."
  type        = string
}

variable "destination_function_id" {
  description = "Resource ID of the target Azure Function."
  type        = string
}

variable "project_prefix" {
  description = "Project prefix for naming."
  type        = string
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
}

variable "servicebus_queue_id" {
  description = "Resource ID of the Service Bus queue for Event Grid delivery."
  type        = string
}
