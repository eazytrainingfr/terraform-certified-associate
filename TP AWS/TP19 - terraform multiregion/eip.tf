provider "aws" {
  region     = "us-east-1"
  shared_credentials_files = ["./.aws/credentials"]
}

provider "aws" {
  alias      = "aws02"
  region     = "us-west-1"
  shared_credentials_files = ["./.aws/credentials"]
}


resource "aws_eip" "myeip" {
  domain = "vpc"
}

resource "aws_eip" "myeip01" {
  domain = "vpc"
  provider = aws.aws02
}
