resource "aws_db_subnet_group" "rds_subnet" {
  name = "rds-subnet-group"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}

resource "aws_db_instance" "rds" {
  identifier = "efrei-rds"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "tpdb"
  username = var.db_user
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = false

  backup_retention_period = 0
  skip_final_snapshot     = true

  maintenance_window = "sat:01:00-sat:03:00"
}