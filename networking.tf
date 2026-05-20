#################################
# ROUTE TABLES
#################################

resource "aws_route_table" "primary_route_table" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary_vpc.id

  depends_on = [
    aws_vpc_peering_connection_accepter.secondary_to_primary
  ]

  tags = {
    Name    = "Primary Route Table"
    Peering = "primary-to-secondary-peering"
  }
}

resource "aws_route_table" "secondary_route_table" {
  provider = aws.secondary
  vpc_id   = aws_vpc.secondary_vpc.id

  depends_on = [
    aws_vpc_peering_connection_accepter.secondary_to_primary
  ]

  tags = {
    Name = "Secondary Route Table"
  }
}

resource "aws_route_table_association" "primary_subnet_route_table_association" {
  provider       = aws.primary
  subnet_id      = aws_subnet.primary_subnet.id
  route_table_id = aws_route_table.primary_route_table.id
}

resource "aws_route_table_association" "secondary_subnet_route_table_association" {
  provider       = aws.secondary
  subnet_id      = aws_subnet.secondary_subnet.id
  route_table_id = aws_route_table.secondary_route_table.id
}

#################################
# ROUTES FOR PEERING
#################################

resource "aws_route" "primary_to_secondary" {
  provider                  = aws.primary
  route_table_id            = aws_route_table.primary_route_table.id
  destination_cidr_block    = var.secondary_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id
}

resource "aws_route" "secondary_to_primary" {
  provider                  = aws.secondary
  route_table_id            = aws_route_table.secondary_route_table.id
  destination_cidr_block    = var.primary_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id
}