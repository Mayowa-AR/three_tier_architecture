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


resource "aws_internet_gateway" "cba_igw" {
  vpc_id = aws_vpc.three_tier_vpc.id

  tags = {
    Name = "Apache_IGW"
  }
}




