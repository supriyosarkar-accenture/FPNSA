variable "resource_group_name" {
  description = "Resource group name for the Function App."
  type        = string
}

variable "location" {
  description = "Location for the Function App."
  type        = string
}

variable "name" {
  description = "Function App name."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account used by the Function App."
  type        = string
}

variable "storage_account_access_key" {
  description = "Primary access key for the Function App storage account."
  type        = string
}

variable "storage_account_connection_string" {
  description = "Connection string for the Function App storage account."
  type        = string
}

variable "app_insights_instrumentation_key" {
  description = "Instrumentation key for App Insights."
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service plan."
  type        = string
}

variable "service_bus_connection_string" {
  description = "Service Bus connection string."
  type        = string
}
