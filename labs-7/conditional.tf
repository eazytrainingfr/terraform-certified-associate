provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

resource "aws_instance" "dev" {
   ami = "ami-012cc038cc685a0d7"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
   ami = "ami-012cc038cc685a0d7"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}

variable "istest" {}
