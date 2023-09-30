region = "us-east-1"
ami = "ami-04e601abe3e1a910f"
instance_type = "t2.micro"
vpc_cidr = "10.0.0.0/16"
subnet_configs = {
    public_subnet1 = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
      name              = "us_public_subnet1"
    },  
    public_subnet2 = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-east-1b"
      name              = "us_public_subnet2"
    }
    private_subnet1 = {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "us-east-1a"
      name              = "us_private_subnet1"
    },
    private_subnet2 = {
      cidr_block        = "10.0.4.0/24"
      availability_zone = "us-east-1b"
      name              = "us_private_subnet2"
    }
  }
