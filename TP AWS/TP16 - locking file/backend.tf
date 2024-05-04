terraform {
  backend "s3" {
    bucket = "terraform-backend-anselme"
    key    = "remotedemo.tfstate"
    region     = "us-east-1"
    access_key = "YOUR ACCESS KEY"
    secret_key = "YOUR SECRET KEY"
    dynamodb_table = "s3-state-lock"
  }
}
