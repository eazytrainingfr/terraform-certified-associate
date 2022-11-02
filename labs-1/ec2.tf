provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
  #version = "2.7"
}

resource "aws_instance" "myec2" {
  ami           = "ami-00e87074e52e6c9f9"
  instance_type = "t2.micro"
  key_name      = "devops-dirane"
  tags = {
    Name = "ec2-dirane"
  }
}
