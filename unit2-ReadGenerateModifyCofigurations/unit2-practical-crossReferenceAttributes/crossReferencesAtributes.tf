resource "aws_eip" "lb" {
  # instance = aws_instance.web.id
  domain = "vpc"
  tags = {
    Name = "web_server_eip"
  }
}

resource "aws_security_group" "example-attributes" {
  name        = "attribute-security-group"
  description = "Manage security groups since terraform"
  #vpc_id      = aws_vpc.my_vpc_1.id

  tags = {
    Name = "mangage attribute since terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_attributes_ipv4" {
  security_group_id = aws_security_group.example-attributes.id
  # cidr_ipv4         = "0.0.0.0/0"
  cidr_ipv4   = "${aws_eip.lb.public_ip}/32"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
  description = "Allow HTTP traffic on port 443"
  tags = {
    Name = "example-attributes"
  }
}


output "public-ip" {
  value = aws_eip.lb.public_ip
}
output "public-ip-https-protocol" {
  value = "https://${aws_eip.lb.public_ip}:3001"
}
output "public-ip-full-information" {
  value = aws_eip.lb
}

output "example-attributes-name" {
  value = aws_security_group.example-attributes.name
}
