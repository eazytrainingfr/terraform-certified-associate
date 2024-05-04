variable "list" {
  type = list
  default = ["us-east-1", "us-west-1", "ap-south-1"]
}

variable "types" {
  type = map(string)
  default = {
    "us-east-1" = "t2.micro"
    "us-west-1" = "t2.nano"
    "ap-south-1" = "t2.small"
  }
}