resource "aws_eip" "eip" {
  domain   = "vpc"
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "IGW"
  }
}


resource "aws_nat_gateway" "my_nat" {
 allocation_id     = aws_eip.eip.id
 subnet_id         = aws_subnet.my_subnets["public_subnet1"].id 
  tags= {
    Name: "NAT"
  }
}