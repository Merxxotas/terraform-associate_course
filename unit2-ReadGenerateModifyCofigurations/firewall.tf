resource "aws_eip" "lb" {
  # instance = aws_instance.web.id
  domain = "vpc"
  tags = {
    Name = "web_server_eip"
  }
}

#Security Group Rules
resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall-example"
  description = "Manage firewalls since terraform"
  #vpc_id      = aws_vpc.my_vpc_1.id

  tags = {
    Name = "firewalls managed since terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  # cidr_ipv4         = "0.0.0.0/0"
  cidr_ipv4   = "${aws_eip.lb.public_ip}/32"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  description = "Allow HTTP traffic on port 80"
  tags = {
    Name = "allow_tls_ipv4"
  }
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  description       = "Allow all traffic on all ports of IPv4"
  tags = {
    Name = "allow_all_traffic_ipv4"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "::/0"
  # cidr_ipv6   = "${aws_eip.lb.public_ip}/128"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  description = "Allow HTTP traffic on port 80"
  tags = {
    Name = "allow_tls_ipv6"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  description       = "Allow all traffic on all ports of IPv6"
  tags = {
    Name = "allow_all_traffic_ipv6"
  }
}

# Create an elastic IP with eip
resource "aws_instance" "web_instance_since_terraform" {
  ami           = "ami-053602453dbcba9be" # Free Tier
  instance_type = "t2.micro"
  subnet_id     = "subnet-0805a6fdb2a9e82c9" # Subnet ID created manually

  tags = {
    Name = "InstanceEC2SinceTerraformUnit2"
  }
}
