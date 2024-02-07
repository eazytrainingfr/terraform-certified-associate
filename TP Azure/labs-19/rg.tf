resource "azurerm_resource_group" "eazy_rg" {
  name     = "eazy-rg"
  location = "West Europe"
}

resource "azurerm_resource_group" "eazy_rg2" {
  provider = azurerm.azurerm2
  name     = "eazy-rg2"
  location = "West Europe"
}