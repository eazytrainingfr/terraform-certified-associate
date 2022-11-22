provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

resource "aws_instance" "instance-1" {
   ami = "ami-012cc038cc685a0d7"
   instance_type = "t2.micro"
   count = 3
}
