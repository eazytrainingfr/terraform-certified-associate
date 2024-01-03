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

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "environment" {
  default = "development"
}

variable "resource-group-name" {
  type = map(any)
  default = {
    development = "dev-rg"
    staging     = "stage-rg"
    production  = " prod-rg"
  }
}

variable "tags" {
  type    = list(any)
  default = ["firstvm", "secondevm"]
}

output "timestamp" {
  value = local.time
}

variable "vm-size" {
  type    = list(any)
  default = ["Standard_DS1_v2", "Standard_DS8_v2"]
}

# Create a resource group
resource "azurerm_resource_group" "eazy_rg" {
  name     = lookup(var.resource-group-name, var.environment) # lookup permet de parcourir une map
  location = "West Europe"
}

resource "azurerm_virtual_network" "eazy_network" {
  name                = "eazy-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.eazy_rg.location
  resource_group_name = azurerm_resource_group.eazy_rg.name
}

resource "azurerm_subnet" "eazy_subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.eazy_rg.name
  virtual_network_name = azurerm_virtual_network.eazy_network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "vm_ni" {
  name                = "vm-nic"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.eazy_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.eazy_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "eazy_vm" {
  count                 = 2
  name                  = "eazy-vm"
  location              = "West Europe"
  resource_group_name   = azurerm_resource_group.eazy_rg.name
  network_interface_ids = [azurerm_network_interface.vm_ni.id]
  vm_size               = var.vm-size[0]

  # to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "franklin"
    admin_password = "Franklin123@"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    Name = element(var.tags, count.index) # element permet de parcourir une liste
  }
}
