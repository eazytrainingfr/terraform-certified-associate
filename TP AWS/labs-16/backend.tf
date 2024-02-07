terraform {
  backend "s3" {
    bucket = "terraform-backend-dirane"
    key    = "remotedemo.tfstate"
    region     = "us-east-1"
    access_key = "PUT YOUR OWN"
    secret_key = "PUT YOUR OWN"
    dynamodb_table = "s3-state-lock"
  }
}
