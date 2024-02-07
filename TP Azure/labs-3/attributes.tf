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

# Create a resource group
resource "azurerm_resource_group" "eazy_rg" {
  name     = "eazy-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "eazy_storage_account" {
  name                     = "eazysa"
  resource_group_name      = "eazy-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "eazy_storage_container" {
  name                  = "eazysc"
  storage_account_name  = "eazysa"
  container_access_type = "private"
}

resource "azurerm_storage_blob" "eazy_storage_blob" {
  name                   = "eazyblob"
  storage_account_name   = "eazysa"
  storage_container_name = "eazysc"
  type                   = "Block"
}

output "myblob" {
  value = azurerm_storage_blob.eazy_storage_blob
}

output "mystorageaccount" {
  value = azurerm_storage_account.eazy_storage_account.name
}