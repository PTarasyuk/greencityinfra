output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "intra_subnets" {
  value = module.vpc.intra_subnets
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "db_instance_address" {
  value = module.rds.db_instance_address
}

output "db_instance_arn" {
  value = module.rds.db_instance_arn
}

output "db_instance_endpoint" {
  value = module.rds.db_instance_endpoint
}
