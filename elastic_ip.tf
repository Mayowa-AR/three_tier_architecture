resource "aws_eip" "nat1" {
  #Use depends_on to set an explicit dependency on internet gateway.
  depends_on = [aws_internet_gateway.main_igw]

  tags = {
    Name = "NAT-GW-EIP-1"
  }
}

resource "aws_eip" "nat2" {
  #Use depends_on to set an explicit dependency on internet gateway.
  depends_on = [aws_internet_gateway.main_igw]

  tags = {
    Name = "NAT-GW-EIP-2"
  }
}
