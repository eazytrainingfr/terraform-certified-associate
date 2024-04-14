provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR ACCESS KEY"
  secret_key = "YOUR SECRET KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-012cc038cc685a0d7"
  instance_type = lookup(var.instance_type, terraform.workspace)
}


