resource "aws_s3_bucket" "shiva" {
  bucket = local.bucket_name

  tags = {

    Name        = lower("${local.environment}-bucket-${var.bucket_name}")
    Environment = local.environment
    owner       = local.owner
    reference   = local.reference

  }
}


