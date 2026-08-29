locals {
  environment = var.environment
  owner       = "MarellaSiva.Kumar"
  reference   = "terraform"
  bucket_name = lower("${var.environment}-bucket-${var.bucket_name}")
  vpc_name    = lower("${var.environment}-terraform-vpc")

  # Define your reusable tags here
  common_tags = {
    Environment = var.environment
    owner       = "MarellaSiva.Kumar"
    reference   = "terraform"
  }
}