variable "vpc_id" {
  description = "ID of the VPC where subnets will be created"
  type        = string
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
}

variable "vpn_ips" {
  description = "List of VPN IPs for each instance"
  type        = list(string)
}

variable "app_ports" {
  description = "List of App ports for each instance"
  type        = list(number)
}

variable "ssh_ports" {
  description = "List of SSH ports for each instance"
  type        = list(number)
}

variable "ftp_ports" {
  description = "List of FTP ports for each instance"
  type        = list(number)
}

variable "ami" {
  description = "value of the ami for sa-east-1 (Free tier eligible)"
  type        = list(string)
}

variable "ami_instance_type" {
  description = "value of the instance type"
  type        = string
}

variable "count_ami_instance" {
  description = "The number of instances to launch."
  type        = number
}

variable "root_volume_size" {
  description = "The size of the root volume in GB"
  type        = list(number)
}

variable "root_volume_type" {
  description = "The type of the root volume"
  type        = string
}

variable "is_test" {
  description = "If true, the resources will be created in the test environment"
  type        = bool
}
