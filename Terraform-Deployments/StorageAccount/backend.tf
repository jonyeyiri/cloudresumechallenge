terraform {
    backend "azurerm" {
        resource_group_name  = "rg-us-east-jojotech-challenge-prod"
        storage_account_name = "jojotech30942e505235ef10"
        container_name       = "tfstatefiles"
        key                  = "storage.tfstate"
    }
        }