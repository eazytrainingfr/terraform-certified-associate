
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

resource "aws_instance" "dev" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
  count         = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
  count         = var.istest == false ? 1 : 0
}

variable "istest" {

}
