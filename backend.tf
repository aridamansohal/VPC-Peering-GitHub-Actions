terraform {

  backend "s3" {

    bucket = "tf-state-aridaman-12345"

    key = "vpc-peering/terraform.tfstate"

    region = "us-east-1"

    dynamodb_table = "terraform-lock"

  }

}

