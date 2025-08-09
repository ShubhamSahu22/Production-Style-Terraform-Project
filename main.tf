provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  region = var.aws_region
}

module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  public_subnet = module.vpc.public_subnet_id
  private_subnet = module.vpc.private_subnet_id
  sg_bastion = aws_security_group.sg_bastion.id
  sg_app = aws_security_group.sg_app.id
  key_pair = var.key_pair
}

module "rds" {
  source = "./modules/rds"
  db_user = var.db_user
  db_pass = var.db_pass
  private_subnets = [module.vpc.private_subnet_id]
  sg_db = aws_security_group.sg_db.id
}

# Bastion SG
resource "aws_security_group" "sg_bastion" {
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# App SG
resource "aws_security_group" "sg_app" {
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.sg_bastion.id]
  }
}

# DB SG
resource "aws_security_group" "sg_db" {
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.sg_app.id]
  }
}
