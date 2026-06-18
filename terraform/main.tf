module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  project_prefix = var.project_prefix
  environment    = var.environment
}

module "storage" {
  source                  = "./modules/storage_account"
  resource_group_name     = module.resource_group.name
  location                = var.location
  account_name            = var.storage_account_name
  account_tier            = "Standard"
  account_replication_type = "LRS"
}

module "function_storage" {
  source                  = "./modules/storage_account"
  resource_group_name     = module.resource_group.name
  location                = var.location
  account_name            = var.function_storage_account_name
  account_tier            = "Standard"
  account_replication_type = "LRS"
}

module "app_insights" {
  source              = "./modules/app_insights"
  resource_group_name = module.resource_group.name
  location            = var.location
  name                = var.app_insights_name
}

module "log_analytics" {
  source              = "./modules/log_analytics"
  resource_group_name = module.resource_group.name
  location            = var.location
  name                = var.log_analytics_name
}

module "service_bus" {
  source              = "./modules/service_bus"
  resource_group_name = module.resource_group.name
  location            = var.location
  namespace_name      = var.servicebus_namespace_name
  queue_name          = var.servicebus_queue_name
}

module "function_app" {
  source                        = "./modules/function_app"
  resource_group_name           = module.resource_group.name
  location                      = var.location
  name                          = var.function_app_name
  storage_account_name          = module.function_storage.name
  storage_account_access_key    = module.function_storage.primary_access_key
  storage_account_connection_string = module.function_storage.primary_connection_string
  app_insights_instrumentation_key = module.app_insights.instrumentation_key
  service_bus_connection_string  = module.service_bus.primary_connection_string
  app_service_plan_name         = "${var.project_prefix}-${var.environment}-plan"
}

module "event_grid" {
  source                    = "./modules/event_grid"
  resource_group_name       = module.resource_group.name
  storage_account_id        = module.storage.id
  destination_function_id   = module.function_app.id
  servicebus_queue_id       = module.service_bus.queue_id
  location                  = var.location
  project_prefix            = var.project_prefix
  environment               = var.environment
}

module "logic_app" {
  source              = "./modules/logic_app"
  resource_group_name = module.resource_group.name
  location            = var.location
  name                = var.logic_app_name
}

module "key_vault" {
  source              = "./modules/key_vault"
  resource_group_name = module.resource_group.name
  location            = var.location
  name                = var.key_vault_name
}
