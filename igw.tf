resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.three_tier_vpc.id

  tags = {
    Name = "Apache_IGW"
  }
}

resource "aws_eip" "nat_1" {
  depends_on = [aws_internet_gateway.main_igw]
}

resource "aws_eip" "nat_2" {
  depends_on = [aws_internet_gateway.main_igw]
}

