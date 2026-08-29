resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.shiva.id

  route {
    cidr_block = var.public_routes
    gateway_id = aws_internet_gateway.example.id
  }
  #   route {
  #     cidr_block = "10.1.0.0/24"
  #     gateway_id = aws_internet_gateway.example.id
  #   }

  #   route {
  #     cidr_block = "10.2.0.0/24"
  #     gateway_id = aws_internet_gateway.example.id
  #   }


  tags = {
    Name        = lower("${local.environment}-public-rt")
    Environment = local.environment
    owner       = local.owner
    reference   = local.reference

  }
}

resource "aws_route_table_association" "public_assoc" {
  #   subnet_id      = aws_subnet.public_subnet.id
  for_each       = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id

}











