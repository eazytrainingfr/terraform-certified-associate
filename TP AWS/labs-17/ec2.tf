resource "aws_instance" "myec2" {
  ami           = "ami-08f3d892de259504d"
  instance_type = "t2.micro"
  key_name      = "devops-dirane"
  vpc_security_group_ids = ["sg-00a98ddaa08e152c7"]
  subnet_id = "subnet-634f983c"
  tags = {
    Name = "terraform"
  }
}
