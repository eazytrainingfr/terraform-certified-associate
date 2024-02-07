# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "eazy_rg" {
  count    = 3
  name     = "eazy-rg-${count.index}"
  location = "West Europe"
}

output "rg-name" {
  value = azurerm_resource_group.eazy_rg[*].name
}
