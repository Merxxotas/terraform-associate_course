variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "sa-east-1"
}

variable "aws_profile" {
  description = "The AWS profile to use for deployment."
  type        = string
  default     = "brayanDevOps"
}

variable "aws_availability_zone" {
  description = "The AWS availability zone to deploy resources in."
  type        = string
  default     = "sa-east-1a" # Cambia esto a una zona de disponibilidad válida
}

variable "aws_subnet_id" {
  description = "The ID of the subnet to deploy resources in."
  type        = string
  default     = "subnet-0805a6fdb2a9e82c9" # Cambia esto a la ID de tu subred
}
