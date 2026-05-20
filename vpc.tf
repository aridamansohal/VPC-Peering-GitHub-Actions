resource "aws_vpc" "primary_vpc" {
  provider             = aws.primary
  cidr_block           = var.primary_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Primary VPC"
  }

}


resource "aws_vpc" "secondary_vpc" {
  provider             = aws.secondary
  cidr_block           = var.secondary_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Secondary VPC"
  }

}


resource "aws_subnet" "primary_subnet" {
  provider                = aws.primary
  vpc_id                  = aws_vpc.primary_vpc.id
  cidr_block              = var.primary_subnet
  availability_zone       = data.aws_availability_zones.primary.names[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "Primary Subnet"
  }

}

resource "aws_subnet" "secondary_subnet" {
  provider                = aws.secondary
  vpc_id                  = aws_vpc.secondary_vpc.id
  cidr_block              = var.secondary_subnet
  availability_zone       = data.aws_availability_zones.secondary.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "Secondary Subnet"
  }

}

# resource "aws_vpc" "vpc_c" {
#   provider             = aws.primary
#   cidr_block           = var.vpc_c_cidr_block
#   enable_dns_hostnames = true
#   enable_dns_support   = true

#   tags = {
#     Name = "VPC C"
#   }

# }
