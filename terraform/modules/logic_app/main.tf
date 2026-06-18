resource "azurerm_logic_app_workflow" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  definition = jsonencode({
    "$schema" = "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2019-05-01/workflowdefinition.json#"
    contentVersion = "1.0.0.0"
    actions = {}
    triggers = {}
    outputs = {}
  })
}

output "name" {
  value = azurerm_logic_app_workflow.this.name
}
