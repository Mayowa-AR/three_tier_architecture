resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Allow internal traffic only"
  vpc_id      = aws_vpc.three_tier_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # allow outbound via NAT
  }

  tags = {
    Name = "Private SG"
  }
}
