output "primary_vpc_id" {
  value = aws_vpc.primary_vpc.id
}

output "secondary_vpc_id" {
  value = aws_vpc.secondary_vpc.id
}

output "primary_peering_connection_id" {
  value = aws_vpc_peering_connection.primary_to_secondary.id
}

output "secondary_peering_connection_id" {
  value = aws_vpc_peering_connection_accepter.secondary_to_primary.id
}
