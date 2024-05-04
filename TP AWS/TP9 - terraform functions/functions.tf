# Note: terraform console permet de tester rapidement certaines fonctions


provider "aws" {
  region     = var.region
  access_key = "YOUR ACCESS KEY"
  secret_key = "YOUR SECRET KEY"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}


resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region) # lookup permet de parcourir une map
  instance_type = "t2.micro"
  key_name      = aws_key_pair.loginkey.key_name
  count         = 2
  tags = {
    Name = element(var.tags, count.index) # element permet de parcourir une liste
  }
}


