variable "resource_group_name" {
  description = "Resource group for the storage account."
  type        = string
}

variable "location" {
  description = "Location for the storage account."
  type        = string
}

variable "account_name" {
  description = "Storage account name."
  type        = string
}

variable "account_tier" {
  description = "Storage account tier."
  type        = string
}

variable "account_replication_type" {
  description = "Storage account replication type."
  type        = string
}
