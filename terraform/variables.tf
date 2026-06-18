variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "project_prefix" {
  description = "Short project prefix used for naming resources."
  type        = string
  default     = "fpnsa"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"
}

variable "storage_account_name" {
  description = "Primary storage account name for uploaded files."
  type        = string
}

variable "function_storage_account_name" {
  description = "Storage account name used by the Function App."
  type        = string
}

variable "servicebus_namespace_name" {
  description = "Service Bus namespace name."
  type        = string
}

variable "servicebus_queue_name" {
  description = "Service Bus queue name."
  type        = string
  default     = "fileprocessing"
}

variable "function_app_name" {
  description = "Azure Function App name."
  type        = string
}

variable "logic_app_name" {
  description = "Logic App workflow name."
  type        = string
}

variable "key_vault_name" {
  description = "Key Vault name for secrets."
  type        = string
}

variable "app_insights_name" {
  description = "Application Insights resource name."
  type        = string
}

variable "log_analytics_name" {
  description = "Log Analytics workspace name."
  type        = string
}
