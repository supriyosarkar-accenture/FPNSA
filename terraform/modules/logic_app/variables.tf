variable "resource_group_name" {
  description = "Resource group for Logic App."
  type        = string
}

variable "location" {
  description = "Location for Logic App."
  type        = string
}

variable "name" {
  description = "Logic App workflow name."
  type        = string
}

variable "workflow_definition" {
  description = "The definition for the Logic App workflow (JSON encoded as string)."
  type        = string
  default     = <<EOF
{
  "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2019-05-01/workflowdefinition.json#",
  "contentVersion": "1.0.0.0",
  "actions": {},
  "triggers": {},
  "outputs": {}
}
EOF
}
