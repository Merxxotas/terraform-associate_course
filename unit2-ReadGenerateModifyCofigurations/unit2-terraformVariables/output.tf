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
output "developer_ami" {
  value = [for instance in aws_instance.developer_ec2 : instance.ami]
}
output "developer_instance_type" {
  value = [for instance in aws_instance.developer_ec2 : instance.instance_type]
}

output "developer_subnet_id" {
  value = [for instance in aws_instance.developer_ec2 : instance.subnet_id]
}

output "developer_root_volume_size" {
  value = [for instance in aws_instance.developer_ec2 : instance.root_block_device[0].volume_size]
}

output "developer_storage_type" {
  value = [for instance in aws_instance.developer_ec2 : instance.root_block_device[0].volume_type]
}

output "administrative_ami" {
  value = [for instance in aws_instance.administrative_ec2 : instance.ami]
}

output "administrative_instance_type" {
  value = [for instance in aws_instance.administrative_ec2 : instance.instance_type]
}

output "administrative_subnet_id" {
  value = [for instance in aws_instance.administrative_ec2 : instance.subnet_id]
}

output "administrative_root_volume_size" {
  value = [for instance in aws_instance.administrative_ec2 : instance.root_block_device[0].volume_size]
}

output "administrative_storage_type" {
  value = [for instance in aws_instance.administrative_ec2 : instance.root_block_device[0].volume_type]
}
