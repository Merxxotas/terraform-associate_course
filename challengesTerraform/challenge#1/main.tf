terraform {
  required_version = "0.12.31"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.54"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "digitalocean" {}