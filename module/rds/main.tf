resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.username
  password             = var.password
  publicly_accessible  = var.publicly_accessible
  skip_final_snapshot  = true
  db_subnet_group_name = var.subnet_group

  vpc_security_group_ids = var.security_group_ids
}
