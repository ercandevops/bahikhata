terraform {
  required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        version = "=4.76.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "463b3526-cc09-4609-97e3-dbe5a21dffce"
}