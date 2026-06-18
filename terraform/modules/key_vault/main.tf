resource "azurerm_key_vault" "this" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
  soft_delete_retention_days  = 7
  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }
}

data "azurerm_client_config" "current" {}

output "name" {
  value = azurerm_key_vault.this.name
}
