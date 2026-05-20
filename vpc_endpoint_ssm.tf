resource "aws_vpc_endpoint" "primary_ssm_endpoint" {
  for_each            = local.ssm_endpoint
  provider            = aws.primary
  vpc_id              = aws_vpc.primary_vpc.id
  service_name        = "com.amazonaws.${var.primary_aws_region}.${each.value}"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.primary_vpcendpoint_sg.id]
  private_dns_enabled = true
  subnet_ids          = [aws_subnet.primary_subnet.id]

}

resource "aws_vpc_endpoint" "secondary_ssm_endpoint" {
  for_each            = local.ssm_endpoint
  provider            = aws.secondary
  vpc_id              = aws_vpc.secondary_vpc.id
  service_name        = "com.amazonaws.${var.secondary_aws_region}.${each.value}"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.secondary_vpcendpoint_sg.id]
  private_dns_enabled = true
  subnet_ids          = [aws_subnet.secondary_subnet.id]

}
