terraform {
  backend "azurerm" {
    resource_group_name = "tfstateRG01"
    storage_account_name = "tfstate011804477202"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}