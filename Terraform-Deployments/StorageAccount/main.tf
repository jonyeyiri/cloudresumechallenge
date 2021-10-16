provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "random_id" "randomID" {
  keepers = {
    resource_group = data.azurerm_resource_group.rg.name
  }

  byte_length = 8
}

resource "azurerm_storage_account" "sa" {
  name                     = join("", [var.storage_account_name_prefix, random_id.randomID.hex])
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}


resource "azurerm_storage_container" "container" {
  name                  = var.storage_account_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.sa
  ]
}