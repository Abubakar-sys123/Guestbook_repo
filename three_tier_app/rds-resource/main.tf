data "aws_secretsmanager_secret" "rds_secret" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id = data.aws_secretsmanager_secret.rds_secret.id
}

locals {
  rds_credentials = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_version.secret_string)
}

# 🔹 Subnet group for private subnets
resource "aws_db_subnet_group" "this" {
  name       = "guestbook-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "guestbook-db-subnet-group"
  }
}

# 🔹 RDS Instance
resource "aws_db_instance" "this" {
  identifier              = "guestbook-db"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20

  db_name                 = local.rds_credentials["dbname"]
  username                = local.rds_credentials["username"]
  password                = local.rds_credentials["password"]
  port                    = 3306

  vpc_security_group_ids  = [var.rds_sg_id]
  db_subnet_group_name    = aws_db_subnet_group.this.name

  publicly_accessible     = false
  skip_final_snapshot     = true
}

