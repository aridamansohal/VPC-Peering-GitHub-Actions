terraform {
  required_version = ">=1.5.0"
  backend "s3" {

    bucket = "tf-state-aridaman-12345"

    key = "vpc-peering/terraform.tfstate"

    region = "us-east-1"

    dynamodb_table = "terraform-lock"

  }

}

