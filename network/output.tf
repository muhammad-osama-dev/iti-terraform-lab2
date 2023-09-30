# network/outputs.tf

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "vpc_cidr" {
  description = "cidr of vpc"
  value = aws_vpc.my_vpc.cidr_block
}

output "public_subnet_id1" {
  description = "IDs of the public subnet"
  value       = aws_subnet.my_subnets["public_subnet1"].id
}

output "private_subnet_id1" {
  description = "IDs of the private subnets"
  value       = aws_subnet.my_subnets["private_subnet1"].id
}
