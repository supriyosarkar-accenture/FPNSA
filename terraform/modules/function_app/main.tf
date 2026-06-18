resource "azurerm_app_service_plan" "this" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "FunctionApp"
  reserved            = true
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "this" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.this.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                    = "~4"
  site_config {
    application_stack {
      python_version = "~3.11"
    }
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME       = "python"
    AzureWebJobsStorage            = var.storage_account_connection_string
    APPINSIGHTS_INSTRUMENTATIONKEY = var.app_insights_instrumentation_key
    ServiceBusConnection           = var.service_bus_connection_string
    ServiceBusQueueName            = "fileprocessing"
  }
}
