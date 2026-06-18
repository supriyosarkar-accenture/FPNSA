resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags = {
    project     = var.project_prefix
    environment = var.environment
  }
}
