resource "aws_security_group" "db_sg" {
  name        = "database-sg"
  description = "Allow MySQL access from app tier"
  vpc_id      = aws_vpc.three_tier_vpc.id

  # Only allow access on port 3306 from a specific security group (e.g., app tier SG)
  ingress {
    description      = "MySQL from App SG"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.private_sg.id]  # Reference the app tier SG
  }

  # Allow outbound internet access if needed (e.g., to pull updates)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DB Security Group"
  }
}
