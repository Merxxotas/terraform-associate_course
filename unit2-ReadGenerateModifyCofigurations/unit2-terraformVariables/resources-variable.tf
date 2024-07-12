resource "aws_iam_user" "userProof" {
  name = "userProof"
  tags = {
    Name = "userProof created for functions terraform"
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "demo-user-policy"
  user   = aws_iam_user.userProof.name
  policy = file("./iam-user-policy.json")
}

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

resource "aws_instance" "developer_ec2" {
  # count         = var.count_ami_instance
  count         = var.is_test ? var.count_ami_instance : 0
  ami           = var.ami[0] # Amazon Linux Free tier eligible
  instance_type = var.ami_instance_type
  subnet_id     = element(aws_subnet.my_subnets.*.id, count.index % length(aws_subnet.my_subnets.*.id))

  root_block_device {
    volume_size = var.root_volume_size[0] # 10 GB
    volume_type = var.root_volume_type
  }

  tags = {
    Name        = "DeveloperInstanceEC2-CreatedSinceTerraform-${count.index}"
    Environment = "Development"
    Owner       = "JohnDoe"
  }
}

resource "aws_instance" "administrative_ec2" {
  # count         = var.count_ami_instance
  count         = var.is_test ? var.count_ami_instance : 0
  ami           = var.ami[1] # Windows Server Free tier eligible
  instance_type = var.ami_instance_type
  subnet_id     = element(aws_subnet.my_subnets.*.id, count.index % length(aws_subnet.my_subnets.*.id))

  root_block_device {
    volume_size = var.root_volume_size[1] # 30 GB
    volume_type = var.root_volume_type
  }

  tags = {
    Name        = "AdministrativeInstanceEC2-createdSinceTerraform-${count.index}"
    Environment = "Administrative"
    Owner       = "JaneDoe"
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
