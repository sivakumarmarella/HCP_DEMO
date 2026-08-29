resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_and_ping"
  description = "Allow SSH and ICMP inbound traffic"
  vpc_id      = aws_vpc.shiva.id # Assumes you have the VPC ID from your subnet

  # Allows SSH from anywhere (For testing. In prod, restrict to your IP)

  dynamic "ingress" {
    for_each = var.service_ports
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}


#   ingress {
#     description = "SSH from anywhere"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # Allows Ping (ICMP) from anywhere
#   ingress {
#     description = "Allow Ping"
#     from_port   = -1
#     to_port     = -1
#     protocol    = "icmp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

# Allows the EC2 instance to reach the outside internet (Required for apt-get update)


#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }