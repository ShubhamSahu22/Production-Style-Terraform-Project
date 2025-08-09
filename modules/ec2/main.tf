# Bastion Host (in Public Subnet)
resource "aws_instance" "bastion" {
  ami = var.ami_id
  instance_type = "t2.micro"
  subnet_id = var.public_subnet
  associate_public_ip_address = true
  vpc_security_group_ids = [var.sg_bastion]
  key_name = var.key_pair
  tags = { Name = "bastion-host" }
}

# App Server (in Private Subnet)
resource "aws_instance" "app" {
  ami = var.ami_id
  instance_type = "t2.micro"
  subnet_id = var.private_subnet
  vpc_security_group_ids = [var.sg_app]
  key_name = var.key_pair
  tags = { Name = "app-server" }
}
