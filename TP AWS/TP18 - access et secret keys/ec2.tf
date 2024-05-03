provider "aws" {
  region     = "us-east-1"
  shared_credentials_files = ["./.aws/credentials"]
}


resource "aws_instance" "myec2" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
}