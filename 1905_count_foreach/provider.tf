terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "82d3dff2-2cf6-4e19-acac-54a089e83994"
}