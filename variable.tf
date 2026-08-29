variable "access_key" {
  description = "AWS Access Key"
  type        = string

}
variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string

}

variable "environment" {
  description = "Environment Name"
  type        = string

}
variable "cidr_block" {
  description = "CIDR Block for the VPC"
  type        = string
}




variable "associate_public_ip_address" {
  type    = bool
  default = "true"

}

variable "public_routes" {
  type = string

}



variable "service_ports" {
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "public_subnets" {
  type = map(string)

}

# variable "aws_route_table_association" {

# type =list(string)



# }


####below for HCP

variable "ssh_public_key" {
  description = "The raw public SSH key string"
  type        = string
}

variable "ssh_private_key" {
  description = "The raw private SSH key string"
  type        = string
  sensitive   = true
}