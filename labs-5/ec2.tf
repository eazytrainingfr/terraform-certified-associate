terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

resource "aws_instance" "myec2" {
  ami = "ami-0f34c5ae932e6f0e4"
  #instance_type = var.types["us-east-1"]
  instance_type = var.list[0]
}

variable "list" {
  type    = list
  default = ["t2.micro", "t2.medium", "t2.large"]
}

variable "types" {
  type = map
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.medium"
    ap-south-1 = "t2.small"
  }
}
