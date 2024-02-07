# Note: terraform console permet de tester rapidement certaines fonctions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-0323c3dd2da7fb37d"
    "us-west-2"  = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
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

output "timestamp" {
  value = local.time
}
