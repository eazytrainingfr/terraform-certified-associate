variable "instance_type" {
  type = map

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod     = "t2.large"
  }
}