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
