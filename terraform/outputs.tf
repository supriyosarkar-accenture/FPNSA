output "resource_group_name" {
  description = "The name of the deployed resource group."
  value       = module.resource_group.name
}

output "storage_account_name" {
  description = "The primary storage account name."
  value       = module.storage.name
}

output "function_app_name" {
  description = "The deployed Function App name."
  value       = module.function_app.name
}

output "service_bus_namespace" {
  description = "The Service Bus namespace name."
  value       = module.service_bus.namespace_name
}

output "service_bus_queue" {
  description = "The Service Bus queue name."
  value       = module.service_bus.queue_name
}

output "logic_app_name" {
  description = "The deployed Logic App workflow name."
  value       = module.logic_app.name
}

output "key_vault_name" {
  description = "The deployed Key Vault name."
  value       = module.key_vault.name
}
