
  resource "aws_instance" "public_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.public_sg] 

  tags = {
    Name = "Group 13 Public Instance"
  }
}


resource "aws_instance" "private_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg] 
  key_name               = var.key_name

  tags = {
    Name = "Group 13 Private Instance"
  }
}