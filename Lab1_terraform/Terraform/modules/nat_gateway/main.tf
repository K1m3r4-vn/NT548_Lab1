resource "aws_eip" "nat_eip" {
  domain="vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_id
  
  tags = {
    Name = "Group 13 NAT Gateway"
  }
}