resource "azurerm_servicebus_namespace" "this" {
  name                = var.namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_servicebus_namespace_authorization_rule" "function_sender" {
  name         = "function-sender"
  namespace_id = azurerm_servicebus_namespace.this.id
  send         = true
}

resource "azurerm_servicebus_queue" "this" {
  name         = var.queue_name
  namespace_id = azurerm_servicebus_namespace.this.id
  partitioning_enabled = false
}

output "namespace_name" {
  value = azurerm_servicebus_namespace.this.name
}

output "queue_name" {
  value = azurerm_servicebus_queue.this.name
}

output "queue_id" {
  value = azurerm_servicebus_queue.this.id
}

output "primary_connection_string" {
  value = azurerm_servicebus_namespace_authorization_rule.function_sender.primary_connection_string
}

output "namespace_id" {
  value = azurerm_servicebus_namespace.this.id
}
