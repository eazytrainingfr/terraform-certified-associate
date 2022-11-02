provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

resource "aws_instance" "instance-1" {
   ami = "ami-00e87074e52e6c9f9"
   instance_type = "t2.micro"
   count = 3
}
