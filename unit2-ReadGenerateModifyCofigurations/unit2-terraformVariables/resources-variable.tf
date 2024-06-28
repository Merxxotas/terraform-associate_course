# # DEMO OF VARIABLES USE IN TERRAFORM
# resource "aws_security_group" "allow_tls" {
#   name        = "terraform-firewall-example"
#   description = "Manage firewalls since terraform"
#   #vpc_id      = aws_vpc.my_vpc_1.id

#   tags = {
#     Name = "firewalls managed since terraform"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = var.vpn_ip
#   from_port         = var.app_port
#   ip_protocol       = "tcp"
#   to_port           = var.app_port
#   description       = "Allow HTTP traffic on port 80"
#   tags = {
#     Name = "allow_tls_ipv4"
#   }
# }

# output "vpn_ip" {
#   value = aws_vpc_security_group_ingress_rule.allow_tls_ipv4.cidr_ipv4
# }
# output "app_port" {
#   value = aws_vpc_security_group_ingress_rule.allow_tls_ipv4.to_port
# }
# output "description" {
#   value = aws_vpc_security_group_ingress_rule.allow_tls_ipv4.description
# }

# PRACTICAL OF VARIABLES IN TERRAFORM
resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall-example"
  description = "Manage firewalls since terraform"

  tags = {
    Name = "firewalls managed since terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.app_port
  ip_protocol       = "tcp"
  to_port           = var.app_port
  description       = "Allow TCP traffic on app by port 3001"
  tags = {
    Name = "app_port_allow"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.ssh_port
  ip_protocol       = "tcp"
  to_port           = var.ssh_port
  description       = "Allow SSH traffic on port 22"
  tags = {
    Name = "SSH_port_allow"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.ftp_port
  ip_protocol       = "tcp"
  to_port           = var.ftp_port
  description       = "Allow FTP traffic on port 21"
  tags = {
    Name = "FTP_port_allow"
  }
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.ami_instance_type
  subnet_id     = var.ami_subnet_id

  tags = {
    Name = "InstanceEC2SinceTerraformUnit2WithVariables-Values-Outputs"
  }
}
