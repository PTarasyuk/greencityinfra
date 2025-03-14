locals {
  env_name = "${var.project_name}-${var.environment}-${replace(var.cluster_version, ".", "-")}"

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = "true"
  }
}


module "vpc" {
  source = "./modules/vpc"

  env_name = local.env_name
  tags     = local.tags

  cidr_block = "10.1.0.0/16"
}

module "eks" {
  depends_on = [module.vpc]

  source = "./modules/eks"

  env_name = local.env_name
  tags     = local.tags

  account_id        = var.account_id
  cluster_version   = var.cluster_version
  external_dns_zone = var.external_dns_zone


  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnets
  control_plane_subnets = module.vpc.intra_subnets
}

module "rds" {
  depends_on = [module.eks]
  source = "./modules/rds"

  env_name = local.env_name
  tags     = local.tags

  vpc_id          = module.vpc.vpc_id
  vpc_cidr_blocks = module.vpc.vpc_cidr_block
  database_subnet_group = module.vpc.database_subnet_group

  db_name = var.db_name
  db_port = var.db_port
  db_username = var.db_username
  db_password = var.db_password
}
