terraform {
  required_version = "1.6.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "Anselme"

    workspaces {
      name = "terraform-local"
    }
  }
}

resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"
}

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}
