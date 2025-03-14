module "eks" {
  putin_khuylo    = "true"
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.31"

  cluster_name    = "${var.env_name}-cluster"
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  cluster_enabled_log_types      = var.cluster_enabled_log_types

  cluster_addons = {
    coredns    = { most_recent = true }
    kube-proxy = { most_recent = true }
    vpc-cni    = { most_recent = true }
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  control_plane_subnet_ids = var.control_plane_subnets

  eks_managed_node_groups = var.eks_managed_node_groups

  access_entries = {
    example = {
      principal_arn = "arn:aws:iam::${var.account_id}:role/tf-admin"
      policy_associations = {
        single = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  tags = var.tags
}
