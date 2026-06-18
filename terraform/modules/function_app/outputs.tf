output "id" {
  description = "Function App resource ID."
  value       = azurerm_function_app.this.id
}

output "name" {
  description = "Function App name."
  value       = azurerm_function_app.this.name
}
