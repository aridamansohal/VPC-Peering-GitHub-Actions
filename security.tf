resource "aws_security_group" "primary_vpc_sg" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary_vpc.id

  tags = {
    Name = "Primary VPC Security Group"
  }
}

resource "aws_security_group_rule" "primary_vpc_sg_ingress" {
  provider          = aws.primary
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  security_group_id = aws_security_group.primary_vpc_sg.id
  cidr_blocks       = [var.secondary_cidr_block]
}

resource "aws_security_group_rule" "primary_vpc_sg_egress" {
  provider          = aws.primary
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.primary_vpc_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "secondary_vpc_sg" {
  provider = aws.secondary
  vpc_id   = aws_vpc.secondary_vpc.id

  tags = {
    Name = "Secondary VPC Security Group"
  }

}

resource "aws_security_group_rule" "secondary_vpc_sg_ingress" {
  provider          = aws.secondary
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  security_group_id = aws_security_group.secondary_vpc_sg.id
  cidr_blocks       = [var.primary_cidr_block]
}

resource "aws_security_group_rule" "secondary_vpc_sg_egress" {
  provider          = aws.secondary
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.secondary_vpc_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}


#################################
# VPC Endpoint Security Group
#################################

resource "aws_security_group" "primary_vpcendpoint_sg" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary_vpc.id

  tags = {
    Name = "Primary VPC Endpoint Security Group"
  }

}



resource "aws_security_group_rule" "primary_vpcendpoint_sg_ingress_443" {
  provider          = aws.primary
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.primary_vpcendpoint_sg.id
  cidr_blocks       = [var.primary_cidr_block]
}

resource "aws_security_group_rule" "primary_vpcendpoint_sg_egress" {
  provider          = aws.primary
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.primary_vpcendpoint_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group" "secondary_vpcendpoint_sg" {
  provider = aws.secondary
  vpc_id   = aws_vpc.secondary_vpc.id

  tags = {
    Name = "Secondary VPC Endpoint Security Group"
  }

}

resource "aws_security_group_rule" "secondary_vpcendpoint_sg_ingress_443" {
  provider          = aws.secondary
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.secondary_vpcendpoint_sg.id
  cidr_blocks       = [var.secondary_cidr_block]
}

resource "aws_security_group_rule" "secondary_vpcendpoint_sg_egress" {
  provider          = aws.secondary
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.secondary_vpcendpoint_sg.id
  cidr_blocks       = ["0.0.0.0/0"]

}