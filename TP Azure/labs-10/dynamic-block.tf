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

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22]
}

variable "rule_name" {
  default = ["rule1", "rule2", "rule3", "rule4", "rule5"]
}
resource "azurerm_network_security_group" "eazy_nsg" {
  name                = "EazySecurityGroup"
  location            = azurerm_resource_group.eazy_rg.location
  resource_group_name = azurerm_resource_group.eazy_rg.name

  dynamic "security_rule" {

    for_each = var.sg_ports
    iterator = port
    content {
      name                       = "AllowInbound"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = port.value
      destination_port_range     = port.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

  dynamic "security_rule" {

    for_each = var.sg_ports
    iterator = port
    content {
      name                       = "AllowOutBound"
      priority                   = 100
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = port.value
      destination_port_range     = port.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

  tags = {
    environment = "Production"
  }
}