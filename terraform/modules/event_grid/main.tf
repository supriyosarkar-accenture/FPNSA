resource "azurerm_eventgrid_system_topic" "storage_events" {
  name                = "${var.project_prefix}-${var.environment}-storage-events"
  location            = var.location
  resource_group_name = var.resource_group_name
  source_resource_id  = var.storage_account_id
  topic_type          = "Microsoft.Storage.StorageAccounts"
}

resource "azurerm_eventgrid_system_topic_event_subscription" "function_subscription" {
  name                         = "${var.project_prefix}-${var.environment}-function-subscription"
  resource_group_name          = var.resource_group_name
  system_topic                 = azurerm_eventgrid_system_topic.storage_events.name
  event_delivery_schema        = "EventGridSchema"
  included_event_types         = ["Microsoft.Storage.BlobCreated"]

  azure_function_endpoint {
    function_id = var.destination_function_id
  }
}
