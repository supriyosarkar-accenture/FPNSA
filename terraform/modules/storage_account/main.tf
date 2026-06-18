resource "azurerm_storage_account" "this" {
  name                         = var.account_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  account_tier                 = var.account_tier
  account_replication_type     = var.account_replication_type
  min_tls_version              = "TLS1_2"
  allow_nested_items_to_be_public = false
  https_traffic_only_enabled   = true
}

output "id" {
  value = azurerm_storage_account.this.id
}

output "name" {
  value = azurerm_storage_account.this.name
}

output "primary_access_key" {
  value = azurerm_storage_account.this.primary_access_key
}

output "primary_connection_string" {
  value = azurerm_storage_account.this.primary_connection_string
}
