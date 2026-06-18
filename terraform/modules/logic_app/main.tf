resource "azurerm_logic_app_workflow" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  workflow_schema = var.workflow_definition
}

output "name" {
  value = azurerm_logic_app_workflow.this.name
}

output "id" {
  value = azurerm_logic_app_workflow.this.id
}
