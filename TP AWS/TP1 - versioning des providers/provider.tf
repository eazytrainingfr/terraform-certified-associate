terraform {
  required_version = "1.6.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
      # version = ">=2.10,<=2.30"
      # version = "2.7"
    }
  }
}

