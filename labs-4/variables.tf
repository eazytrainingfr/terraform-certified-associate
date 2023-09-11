variable "elb_name" {
  type = string
}

variable "subnets" {
  type = list(any)
}

variable "timeout" {
  type = number
}
