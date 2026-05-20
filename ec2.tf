resource "aws_instance" "a" {
  provider                    = aws.primary
  ami                         = data.aws_ami.amazon_linux_primary.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.primary_subnet.id
  vpc_security_group_ids      = [aws_security_group.primary_vpc_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ssm_instance_profile.name

  tags = {
    Name = "Primary Instance"
  }

}


resource "aws_instance" "b" {
  provider                    = aws.secondary
  ami                         = data.aws_ami.amazon_linux_secondary.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.secondary_subnet.id
  vpc_security_group_ids      = [aws_security_group.secondary_vpc_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ssm_instance_profile.name

  tags = {
    Name = "Secondary Instance"
  }

}