provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
  #version = "2.7"
}

resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb.id
}

resource "aws_s3_bucket" "mys3" {
  bucket = "eazytraining-bucket"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3
}
