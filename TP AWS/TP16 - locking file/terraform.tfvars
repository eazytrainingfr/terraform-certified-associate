elb_name = "myelb"
timeout  = 400
az   = ["us-east-1a", "us-east-1b"] # your subnets must be in different availability zones
tags_elb = {
    Name = "foobar-terraform-elb"
  }
