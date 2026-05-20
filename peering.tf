#################################
# VPC PEERING (INTER-REGION)
#################################

resource "aws_vpc_peering_connection" "primary_to_secondary" {
  provider    = aws.primary
  vpc_id      = aws_vpc.primary_vpc.id
  peer_vpc_id = aws_vpc.secondary_vpc.id
  peer_region = var.secondary_aws_region
  auto_accept = false

  tags = {
    Name = "Primary to Secondary VPC Peering"
  }

}


resource "aws_vpc_peering_connection_accepter" "secondary_to_primary" {
  provider                  = aws.secondary
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id
  auto_accept               = true

  tags = {
    Name = "Secondary to Primary VPC Peering Accepter"
  }

}
#DNS Options (Requester Side)
resource "aws_vpc_peering_connection_options" "primary_options" {
  provider                  = aws.primary
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id
  depends_on                = [aws_vpc_peering_connection_accepter.secondary_to_primary]

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}
# #DNS Options (Accepter Side)
# resource "aws_vpc_peering_connection_options" "secondary_options" {
#   provider                  = aws.secondary
#   vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id

#   depends_on = [aws_vpc_peering_connection_accepter.secondary_to_primary]

#   requester {
#     allow_remote_vpc_dns_resolution = true
#   }
# }