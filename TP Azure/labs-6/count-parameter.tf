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

variable "rg_names" {
  type    = list
  default = ["eazy-rg1", "eazy-rg2", "eazy-rg3"]
}

# Create a resource group
resource "azurerm_resource_group" "eazy_rg" {
  count    = 3
  name     = var.rg_names[count.index]
  location = "West Europe"
}