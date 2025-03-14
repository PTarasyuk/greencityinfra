module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.10.0"

  identifier                     = "${var.env_name}-rds"
  instance_use_identifier_prefix = true

  create_db_option_group    = false
  create_db_parameter_group = false

  engine               = "postgres"
  engine_version       = "16.5"
  family               = "postgres16"
  major_engine_version = "16"
  instance_class       = "db.t4g.micro"

  allocated_storage = 10

  db_name = var.db_name
  port    = var.db_port

  manage_master_user_password = false

  username = var.db_username
  password = var.db_password

  vpc_security_group_ids = [module.security_group.security_group_id]

  db_subnet_group_name = var.database_subnet_group

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 0

  tags = var.tags
}
