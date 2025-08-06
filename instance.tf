
resource "aws_instance" "web_1" {
  ami             = data.aws_ssm_parameter.instance_ami.value
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.web_sg.id]
  key_name        = var.key_name
  user_data       = fileexists("install_apache.sh") ? file("install_apache.sh") : null


  tags = {
    "Name" = "Web-Server-1"
  }

  
}



resource "aws_instance" "web_2" {
  ami             = data.aws_ssm_parameter.instance_ami.value
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.web_sg.id]
  key_name        = var.key_name
  user_data       = fileexists("install_apache.sh") ? file("install_apache.sh") : null


  tags = {
    "Name" = "Web-Server-2"
  }

}


# Ec2 instance in private subnet
resource "aws_instance" "private_ec2" {
  ami             = data.aws_ssm_parameter.instance_ami.value
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.private_sg.id]
  key_name        = var.key_name
  user_data       = fileexists("install_apache.sh") ? file("install_apache.sh") : null


  tags = {
    "Name" = "Web-Server-1"
  }

  
}

data "aws_ssm_parameter" "instance_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}