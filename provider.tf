terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "iustin1storage"
    container_name       = "terraformiustin"
    key                  = "iustin-project.tfstate"
  }
}


provider "azurerm" {
  features {}

}