# Infrastructure as Code for Static Site

This directory contains OpenTofu configuration for deploying a test infrastructure on AWS EKS.
The infrastructure is designed to host a simple static website served by nginx, as defined in `k8s/overlays/test/`.

> **Note**: This is a test environment configuration optimized for a simple nginx-based static website.

## Table of Contents

- [Infrastructure Components](#infrastructure-components)
- [Prerequisites](#prerequisites)
- [AWS Credentials Configuration](#aws-credentials-configuration)
- [Infrastructure Deployment](#infrastructure-deployment)
- [Kubernetes Configuration](#kubernetes-configuration)
- [Clean Up](#clean-up)
- [Security Considerations](#security-considerations)
- [Related Files](#related-files)
- [OpenTofu Documentation](#opentofu-documentation)

## Infrastructure Components

### Structure

```bash
$ tree -L 2 -F --dirsfirst terraform/infra
terraform/infra/
├── modules/
│   ├── eks/
│   ├── security/
│   └── vpc/
├── README.md
├── main.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
├── variables.tf
└── versions.tf

5 directories, 7 files
```

### Terraform Modules

We use the Terraform modules for [VPC](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/) and [EKS](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/), created by Anton Babenko, because they already implement most of what we need to create.

- [EKS](modules/eks/README.md)
- [Security](modules/security/README.md)
- [VPC](modules/vpc/README.md)

## Prerequisites

- AWS CLI configured
- OpenTofu >= 1.0
- kubectl
- kustomize

## Usage

### AWS Credentials Configuration

Before deploying, ensure your AWS credentials are properly configured. You can set them up in one of these ways:

1. Using AWS credentials file:

   ```bash
   # Create or edit ~/.aws/credentials
   mkdir -p ~/.aws
   cat << EOF > ~/.aws/credentials
   [default]
   aws_access_key_id = your-access-key
   aws_secret_access_key = your-secret-key
   region = your-region
   EOF

   # Set proper permissions
   chmod 600 ~/.aws/credentials
   ```

2. Using environment variables:

   ```bash
   export AWS_ACCESS_KEY_ID="your-access-key"
   export AWS_SECRET_ACCESS_KEY="your-secret-key"
   export AWS_REGION="your-region"
   ```

Note: Replace `your-access-key`, `your-secret-key`, and region with your actual AWS credentials.

### Infrastructure Deployment

1. Review and adjust variables in `terraform.tfvars` if needed:

   ```hcl
   aws_region      = "same-region"
   cluster_name    = "same-cluster-name"
   cluster_version = "same-cluster-version"
   environment     = "same-environment"
   vpc_cidr        = "same-vpc-cidr"
   ```

2. Initialize OpenTofu:

   ```bash
   tofu init
   ```

3. Review the configuration:

   ```bash
   tofu plan
   ```

4. Apply the configuration:

   ```bash
   tofu apply
   ```

### Kubernetes Configuration

1. Configure kubectl for EKS:

   ```bash
   aws eks update-kubeconfig \
   --region $(tofu output -raw aws_region) \
   --name $(tofu output -raw cluster_name)
   ```

2. Verify connection:

   ```bash
   kubectl cluster-info
   ```

3. Install NGINX Ingress Controller:

   ```bash
   kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.0/deploy/static/provider/aws/deploy.yaml
   ```

4. Deploy the static site:

   ```bash
   kubectl apply -k ../k8s/overlays/test/
   ```

5. Get the site URL:

   ```bash
   # Wait for the Load Balancer to be provisioned
   kubectl -n ingress-nginx get svc ingress-nginx-controller
   ```

### Clean Up

1. Remove Kubernetes resources:

   ```bash
   kubectl delete -k ../k8s/overlays/test/
   ```

2. Remove NGINX Ingress Controller:

   ```bash
   kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.0/deploy/static/provider/aws/deploy.yaml
   ```

3. Destroy infrastructure:

   ```bash
   tofu destroy
   ```

## Related Files

- `k8s/overlays/test/` - Kubernetes manifests for the static site
- `terraform/backend/` - OpenTofu backend configuration

## OpenTofu Documentation

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_security"></a> [security](#module\_security) | ./modules/security | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | AWS Access Key | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes version | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | AWS Secret Key | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for VPC | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | AWS region |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint for EKS control plane |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Kubernetes Cluster Name |
<!-- END_TF_DOCS -->
