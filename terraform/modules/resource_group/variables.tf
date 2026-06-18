variable "name" {
  description = "Resource group name."
  type        = string
}

variable "location" {
  description = "Azure region for resource group."
  type        = string
}

variable "project_prefix" {
  description = "Project prefix tag."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}
