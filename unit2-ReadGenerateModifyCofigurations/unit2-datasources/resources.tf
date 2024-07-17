resource "aws_instance" "web" {
  ami               = data.aws_ami.myimage.image_id
  instance_type     = "t2.micro"
  availability_zone = var.azn
  subnet_id         = "subnet-0805a6fdb2a9e82c9"

  tags = {
    Name = "WebServer"
  }
}
