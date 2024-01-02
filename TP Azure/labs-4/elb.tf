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
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_public_ip" "eazy_pi" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.eazy_rg.location
  resource_group_name = azurerm_resource_group.eazy_rg.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "eazy_lb" {
  name                = var.elb_name
  location            = azurerm_resource_group.eazy_rg.location
  resource_group_name = azurerm_resource_group.eazy_rg.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.eazy_pi.id
  }
}