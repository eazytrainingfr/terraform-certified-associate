variable "resource-group-name" {
  type = map
  default = {
    development = "dev-rg"
    staging     = "stage-rg"
    production  = " prod-rg"
  }
}

variable "vm-size" {
  type = list
  default = ["Standard_DS1_v2", "Standard_DS8_v2"]
}