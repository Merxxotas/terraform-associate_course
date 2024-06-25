# Create a VPC (Free Tier)
#resource "aws_vpc" "my_vpc_1" {
#  cidr_block           = "10.0.0.0/16"
#  enable_dns_support   = true
#  enable_dns_hostnames = true

#  tags = {
#    Name = "my_vpc_1_firewalls"
#  }
#}

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
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "Allow HTTP traffic on port 80"
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
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "Allow HTTP traffic on port 80"
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
