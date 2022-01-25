terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# provider "github" {
#   token        = var.github_token
#   organization = var.github_organization
# }

provider "archive" {
  version = "2.2.0"
}
