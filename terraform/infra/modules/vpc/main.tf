data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "subnet_addrs" {
  source  = "hashicorp/subnets/cidr"
  version = "1.0.0"
  base_cidr_block = var.cidr_block
  networks = [
    {
      name     = "public-1"
      new_bits = 4
    },
    {
      name     = "public-2"
      new_bits = 4
    },
    {
      name     = "private-1"
      new_bits = 4
    },
    {
      name     = "private-2"
      new_bits = 4
    },
    {
      name     = "intra-1"
      new_bits = 8
    },
    {
      name     = "intra-2"
      new_bits = 8
    },
    {
      name     = "database-1"
      new_bits = 8
    },
    {
      name     = "database-2"
      new_bits = 8
    }
  ]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19"

  name = "${var.env_name}-vpc"
  cidr = var.cidr_block

  azs = local.azs

  putin_khuylo = true

  public_subnets  = [
    module.subnet_addrs.network_cidr_blocks["public-1"],
    module.subnet_addrs.network_cidr_blocks["public-2"]
  ]
  private_subnets = [
    module.subnet_addrs.network_cidr_blocks["private-1"],
    module.subnet_addrs.network_cidr_blocks["private-2"]
  ]
  intra_subnets   = [
    module.subnet_addrs.network_cidr_blocks["intra-1"],
    module.subnet_addrs.network_cidr_blocks["intra-2"]
  ]
  database_subnets = [
    module.subnet_addrs.network_cidr_blocks["database-1"],
    module.subnet_addrs.network_cidr_blocks["database-2"]
  ]

  create_database_subnet_group = true

  enable_flow_log = var.enable_flow_log

  enable_nat_gateway  = var.enable_nat_gateway
  single_nat_gateway  = var.single_nat_gateway

  # one_nat_gateway_per_az = var.one_nat_gateway_per_az # TODO: ????

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = var.tags
}

module "endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "5.19"

  vpc_id = module.vpc.vpc_id

  create_security_group = true
  security_group_description = "VPC endpoint security group"
  security_group_rules = {
    ingress_https = {
      description = "HTTPS from VPC"
      cidr_blocks = [var.cidr_block]
    }
  }

  endpoints = {
    sts = {
      service             = "sts"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      tags = { Name = "${var.env_name}-vpc-sts-ep" }
    }
  }
}
