output "description_allow_tls" {
  value = aws_security_group.allow_tls.description

}
output "description_app_port" {
  value = aws_vpc_security_group_ingress_rule.app_port.description
}
output "vpn_ip_app_port" {
  value = aws_vpc_security_group_ingress_rule.app_port.cidr_ipv4
}
output "description_ssh_port" {
  value = aws_vpc_security_group_ingress_rule.ssh_port.description

}
output "vpn_ip_ssh_port" {
  value = aws_vpc_security_group_ingress_rule.ssh_port.cidr_ipv4

}
output "description_ftp_port" {
  value = aws_vpc_security_group_ingress_rule.ftp_port.description
}
output "vpn_ip_ftp_port" {
  value = aws_vpc_security_group_ingress_rule.ftp_port.cidr_ipv4
}

output "ami" {
  value = aws_instance.myec2.ami
}

output "ami_instance_type" {
  value = aws_instance.myec2.instance_type
}

output "ami_subnet_id" {
  value = aws_instance.myec2.subnet_id
}
