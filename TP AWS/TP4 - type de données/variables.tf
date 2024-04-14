variable "elb_name" {
  type = string
}

variable "az" {
  type = list
}


variable "usernumber" {
  type = number
  default = 0
}

variable "timeout" {
  type = number
}
variable "tags_elb" {
  type = map(string)
}
