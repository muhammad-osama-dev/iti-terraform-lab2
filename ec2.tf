
resource "null_resource" "print_public_ip" {
  depends_on = [aws_instance.bastion]

  provisioner "local-exec" {
    command = "echo Public IP: ${aws_instance.bastion.public_ip} > public_ip.txt"
  }
}

resource "aws_instance" "bastion" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.network.public_subnet_id1
  vpc_security_group_ids = [aws_security_group.ssh_from_anywhere.id]
  associate_public_ip_address = true
  key_name               = aws_key_pair.tf-key-pair.id

  user_data = <<-EOF
                #!/bin/bash
                echo '${tls_private_key.rsa-key.private_key_pem}' > /home/ubuntu/private_key.pem
                chmod 400 private_key.pem
                EOF

  tags = {
    Name = "Bastion"
  }
}


resource "aws_instance" "application" {
  ami                    = var.ami 
  instance_type          = var.instance_type 
  subnet_id              = module.network.private_subnet_id1
  vpc_security_group_ids        = [aws_security_group.ssh_and_port3000_from_vpc.id]
  key_name               = aws_key_pair.tf-key-pair.id


  tags = {
    Name = "Application"
  }
}