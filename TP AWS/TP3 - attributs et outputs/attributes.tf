
provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR ACCESS KEY"
  secret_key = "YOUR SECRET KEY"
}

resource "aws_eip" "lb" {
  domain = "vpc"
}


resource "aws_s3_bucket" "mys3" {
  bucket = "eazytraining-bucket"
}

