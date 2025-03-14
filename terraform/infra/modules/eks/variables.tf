variable "env_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "account_id" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "control_plane_subnets" {
  type = list(string)
}

variable "external_dns_zone" {
  type = string
}

# EKS node groups configuration

variable "cluster_endpoint_public_access" {
  type = bool
  default = true
}

variable "cluster_enabled_log_types" {
  type = list(string)
  default = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "eks_managed_node_groups" {
  type = map(
    object({
      desired_capacity = number
      max_capacity     = number
      min_capacity     = number
      instance_types   = list(string)
    })
  )
  default = {
    default = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1
      instance_types   = ["t3.xlarge"]
    }
  }
}

# Helm releases version

variable "helm_releases_version" {
  type        = map(string)
  default     = {
    external-dns                 = "1.15.2"
    aws_load_balancer_controller = "1.11.0"
  }
}
