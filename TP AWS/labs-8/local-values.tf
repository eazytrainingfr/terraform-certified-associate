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

locals {
  common_tags = {
    Owner   = "EAZYTraining"
    service = "Backend"
  }
}

resource "aws_instance" "app-dev" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_instance" "db-dev" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_ebs_volume" "db-ebs" {
  availability_zone = "us-west-2a"
  size              = 40
  tags              = local.common_tags
}

