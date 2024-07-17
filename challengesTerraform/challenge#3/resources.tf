resource "aws_instance" "ec2_instances" {
  for_each = var.instance_config

  ami           = each.value.ami
  instance_type = each.value.instance_type

  tags = {
    Name = each.key
  }
}
