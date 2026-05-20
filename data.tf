data "aws_availability_zones" "primary" {
  provider = aws.primary
}

data "aws_availability_zones" "secondary" {
  provider = aws.secondary

}

data "aws_ami" "amazon_linux_primary" {
  provider    = aws.primary
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}


data "aws_ami" "amazon_linux_secondary" {
  provider    = aws.secondary
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}