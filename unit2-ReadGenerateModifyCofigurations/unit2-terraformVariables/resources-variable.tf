resource "aws_subnet" "my_subnets" {
  count             = length(var.subnet_cidrs)
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "Subnet-created-by-terraform-${count.index}"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall-example"
  description = "Manage firewalls since terraform"

  tags = {
    Name = "firewalls managed since terraform"
  }
}

resource "aws_instance" "myec2" {
  count         = var.count_ami_instance
  ami           = var.ami
  instance_type = var.ami_instance_type
  subnet_id     = element(aws_subnet.my_subnets.*.id, count.index % length(aws_subnet.my_subnets.*.id))

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  tags = {
    Name        = "InstanceEC2SinceTerraformUnit2WithVariables-Values-Outputs-Functions-${count.index}"
    Environment = "Production"
    Owner       = "JohnDoe"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_port" {
  count             = var.count_ami_instance
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ips[count.index]
  from_port         = var.app_ports[count.index]
  ip_protocol       = "tcp"
  to_port           = var.app_ports[count.index]
  description       = "Allow TCP traffic on app by port ${var.app_ports[count.index]}"
  tags = {
    Name = "app_port_allow_${count.index}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
  count             = var.count_ami_instance
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ips[count.index]
  from_port         = var.ssh_ports[count.index]
  ip_protocol       = "tcp"
  to_port           = var.ssh_ports[count.index]
  description       = "Allow SSH traffic on port ${var.ssh_ports[count.index]}"
  tags = {
    Name = "SSH_port_allow_${count.index}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
  count             = var.count_ami_instance
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ips[count.index]
  from_port         = var.ftp_ports[count.index]
  ip_protocol       = "tcp"
  to_port           = var.ftp_ports[count.index]
  description       = "Allow FTP traffic on port ${var.ftp_ports[count.index]}"
  tags = {
    Name = "FTP_port_allow_${count.index}"
  }
}
