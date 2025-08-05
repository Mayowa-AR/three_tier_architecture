provider "aws" {
 region = var.region
}

resource "aws_vpc" "three_tier_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    NAME = "Apache_vpc_three_tier"
  }
}







