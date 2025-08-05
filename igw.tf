resource "aws_internet_gateway" "cba_igw" {
  vpc_id = aws_vpc.three_tier_vpc.id

  tags = {
    Name = "Apache_IGW"
  }
}