variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-0f34c5ae932e6f0e4"
    "us-west-2"  = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}