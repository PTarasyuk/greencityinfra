# Configure the AWS Provider
# This provider will be used to create resources in the specified AWS region
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

provider "random" {}

terraform {
  # Specify required provider versions
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # Specify minimum Terraform version
  required_version = ">= 1.0"
}
