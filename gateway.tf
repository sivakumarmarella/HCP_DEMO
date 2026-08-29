resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.shiva.id

  tags = {
    Name        = lower("${local.environment}-internet-gateway")
    Environment = local.environment
    owner       = local.owner
    reference   = local.reference
  }
}