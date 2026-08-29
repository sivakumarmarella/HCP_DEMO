terraform {
  required_version = ">= 1.0.0"
  cloud {
    organization = "sivakumar_srk"

    workspaces {
      name = "dev-dish"

    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}





# terraform {
#   backend "s3" {
#     bucket       = "tfdaybucket01"
#     key          = "dev/terraform.tfstate"
#     region       = "ap-south-1"
#     use_lockfile = true
#     encrypt      = true
#   }
# }

# terraform {
#   required_version = "1.16.0"

#   cloud {

#     organization = "sivakumar_srk"

#     workspaces {
#       name = "dev-dish"
#     }
#   }
# }