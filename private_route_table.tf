resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.three_tier_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw1.id
  }

  tags = {
    Name = "Private Route Table"
  }
}
