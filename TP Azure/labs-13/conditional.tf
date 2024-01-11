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

resource "azurerm_resource_group" "dev" {
  count = var.istest == true ? 3 : 0
  name     = "rg-dev-${count.index}"
  location = "West Europe"
}

resource "azurerm_resource_group" "prod" {
  count = var.istest == false ? 1 : 0
  name     = "rg-prod"
  location = "West Europe"
}

variable "istest" {}