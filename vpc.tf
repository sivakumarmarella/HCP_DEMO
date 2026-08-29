# Create a VPC
resource "aws_vpc" "shiva" {
  cidr_block = var.cidr_block

  tags = {
    Name = local.vpc_name

    Environment = local.environment
    owner       = local.owner
    reference   = local.reference
  }
}


