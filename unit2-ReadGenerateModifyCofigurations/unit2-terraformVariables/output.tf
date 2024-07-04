output "azs" {
  description = "List of Availability Zones"
  value       = var.azs
}

output "vpn_ips" {
  description = "List of VPN IPs for each instance"
  value       = var.vpn_ips
}

output "app_ports" {
  description = "List of App ports for each instance"
  value       = var.app_ports
}

output "ssh_ports" {
  description = "List of SSH ports for each instance"
  value       = var.ssh_ports
}

output "ftp_ports" {
  description = "List of FTP ports for each instance"
  value       = var.ftp_ports
}
output "subnet_ids" {
  value = [for subnet in aws_subnet.my_subnets : subnet.id]
}

output "ami" {
  value = [for instance in aws_instance.myec2 : instance.ami]
}

output "ami_instance_type" {
  value = [for instance in aws_instance.myec2 : instance.instance_type]
}

output "ami_subnet_id" {
  value = [for instance in aws_instance.myec2 : instance.subnet_id]
}

output "root_volume_size" {
  value = [for instance in aws_instance.myec2 : instance.root_block_device[0].volume_size]
}

output "storage_type" {
  value = [for instance in aws_instance.myec2 : instance.root_block_device[0].volume_type]
}
