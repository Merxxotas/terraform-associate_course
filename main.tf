# main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = "sa-east-1"
  profile = "brayanDevOps"
}

provider "github" {
  token = var.github_token
}

variable "github_token" {
  description = "The GitHub token for API access."
  type        = string
  sensitive   = true
}
