resource "aws_instance" "myec2" {
  ami           = "ami-0057d8e6fb0692b80"
  instance_type = "t2.micro"
  key_name      = "devops-dirane"
  tags = {
    Name = "ec2-dirane"
  }
}
