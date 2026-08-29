resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.shiva.id
  for_each          = var.public_subnets
  cidr_block        = each.value
  availability_zone = each.key

  tags = {
    Name        = lower("${local.environment}-public-subnet1-${each.key})")
    Environment = local.environment
    owner       = local.owner
    reference   = local.reference
  }
}




# resource "aws_subnet" "public_subnet2" {
#   vpc_id            = aws_vpc.shiva.id
#   cidr_block        = var.public_subnet_cidr2
#   availability_zone = "ap-south-1b"


#   tags = {
#     Name        = lower("${local.environment}-public-subnet2")
#     Environment = local.environment
#     owner       = local.owner
#     reference   = local.reference
#   }
# }

