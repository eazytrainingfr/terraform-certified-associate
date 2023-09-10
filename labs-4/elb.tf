terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
  #version = "2.7"
}

resource "aws_lb" "bar" {
  name               = var.elb_name
  subnets = var.subnets

  enable_cross_zone_load_balancing = true
  idle_timeout = var.timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}

resource "aws_lb_listener" "bar_listener" {
  load_balancer_arn = aws_lb.bar.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.bar-target-group.arn
  }
}

resource "aws_lb_target_group" "bar-target-group" {
  name     = "bar-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id = "YOUR VPC ID"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
