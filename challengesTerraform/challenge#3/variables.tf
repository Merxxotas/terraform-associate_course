variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "instance_config" {
  description = "Instance configurations for EC2 instances."
  type = map(object({
    instance_type = string
    ami           = string
  }))

  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-03a6eaae9938c858c" }
    instance2 = { instance_type = "t2.small", ami = "ami-053b0d53c279acc90" }
  }
}
