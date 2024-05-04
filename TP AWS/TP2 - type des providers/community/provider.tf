terraform {
  required_version = "1.6.2"
  required_providers {
    k8s = {
      source  = "banzaicloud/k8s" # https://registry.terraform.io/providers/banzaicloud/k8s/latest
    }
  }
}