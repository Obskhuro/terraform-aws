resource "aws_db_instance" "default" {
  allocated_storage      = 20                     # [cite: 44]
  db_name                = "database_efrei"       # [cite: 42]
  engine                 = "mysql"                # [cite: 39]
  engine_version         = "8.0.39"               # [cite: 40]
  instance_class         = "db.t4g.micro"         # [cite: 43]
  username               = "admin"                # [cite: 42]
  password               = "ton_mot_de_passe"     # À sécuriser [cite: 42]
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  
  # Configuration demandée
  publicly_accessible    = false                  # [cite: 45]
  vpc_security_group_ids = [aws_security_group.rds_sg.id] # [cite: 46]
  backup_retention_period = 0                     # Désactive les sauvegardes 
  
  maintenance_window     = "sat:01:00-sat:03:00"  # Samedi 01H pendant 2H [cite: 54]
}

# Groupe de sécurité pour RDS (Défi 02) [cite: 57, 61]
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL from EC2"
  vpc_id      = "ton_vpc_id" # Utilise celui de ton fichier vpc si existant [cite: 44]

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    # Autorise seulement l'EC2 (à adapter selon tes fichiers) [cite: 57]
    security_groups = [aws_security_group.ec2_sg.id] 
  }
}