terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "eac08841-5119-4501-b5ac-82e7a5d29114"
}