variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_configs" {
  description = "Configuration for subnets"
  type        = map(object({
    cidr_block        = string
    availability_zone = string
    name              = string
  }))
  default = {
    public_subnet1 = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "eu-central-1a"
      name              = "public_subnet1"
    },
    public_subnet2 = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "eu-central-1b"
      name              = "public_subnet2"
    },
    private_subnet1 = {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "eu-central-1a"
      name              = "private_subnet1"
    },
    private_subnet2 = {
      cidr_block        = "10.0.4.0/24"
      availability_zone = "eu-central-1b"
      name              = "private_subnet2"
    }
  }
}