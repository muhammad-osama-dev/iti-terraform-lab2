resource "aws_subnet" "my_subnets" {
  for_each = { for idx, config in var.subnet_configs : idx => config }

  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.value.name
  }
}