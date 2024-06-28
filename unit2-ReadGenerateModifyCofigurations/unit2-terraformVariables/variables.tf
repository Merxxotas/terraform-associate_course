variable "vpn_ip" {
  description = "value of the vpn ip"
  type        = string
}

variable "app_port" {
  #   default     = 3001
  description = "value of the app port"
  type        = number
}

variable "ssh_port" {
  #   default     = 22
  description = "value of the SSH port"
  type        = number
}

variable "ftp_port" {
  #   default     = 21
  description = "value of the FTP port"
  type        = number
}

variable "description" {
  #   default     = "Allow HTTP traffic on port 80"
  description = "value of the description"
  type        = string
}

variable "description_allow_tls" {
  #   default     = "Manage firewalls since terraform"
  description = "value of the description allow tls"
  type        = string
}

variable "description_app_port" {
  #   default     = "Allow TCP traffic on app by port 3001"
  description = "value of the description app port"
  type        = string
}

variable "ami" {
  description = "value of the ami for sa-east-1 (Free tier eligible)"
  type        = string
}

variable "ami_instance_type" {
  description = "value of the instance type"
  type        = string
}

variable "ami_subnet_id" {
  description = "The ID of the subnet to launch the instance in."
  type        = string
}
