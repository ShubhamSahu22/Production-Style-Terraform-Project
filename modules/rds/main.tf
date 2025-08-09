resource "aws_db_instance" "db" {
  allocated_storage = 20
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  username = var.db_user
  password = var.db_pass
  skip_final_snapshot = true
  vpc_security_group_ids = [var.sg_db]
  db_subnet_group_name = aws_db_subnet_group.db_group.name
}

resource "aws_db_subnet_group" "db_group" {
  name = "db-subnet-group"
  subnet_ids = var.private_subnets
}
