terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
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

provider "random" {
}

variable "github_token" {
  description = "The GitHub token for API access."
  type        = string
  sensitive   = true
}

## Export github_Token
# export TF_VAR_github_token=YOUR_GITHUB_TOKEN
