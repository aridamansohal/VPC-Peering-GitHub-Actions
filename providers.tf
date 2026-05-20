terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
}


provider "aws" {
  region = var.primary_aws_region
}

provider "aws" {
  region = var.primary_aws_region
  alias  = "primary"
}

provider "aws" {
  region = var.secondary_aws_region
  alias  = "secondary"
}
