
variable "resource_group_name" {
  description = "the existing azure resource group name"
  type        = string
}

variable "location" {
  description = "location in which the storage account will be created"
  type        = string
}

variable "storage_account_name_prefix" {
  description = "prefix for the storage account name"
  type        = string
}

variable "storage_account_container_name" {
  description = "storage container name"
  type        = string
}

variable "account_tier" {
  description = "the storage account performance tier"
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  description = "the storage account replication type"
  type = string
  default = "LRS"
}