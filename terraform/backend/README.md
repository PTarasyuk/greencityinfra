# Backend Configuration

This directory contains OpenTofu configuration for the S3 backend with DynamoDB state locking.

## Components

- S3 bucket for state storage
- DynamoDB table for state locking
- Required IAM policies

## Usage

1. Review and adjust variables in `terraform.tfvars` if needed:

   ```hcl
   region = "same-region"
   bucket_name = "same-bucket-name"
   dynamodb_table_name = "same-table-name"

   tags = {
     ...same-tags...
   }
   ```

2. Initialize OpenTofu:

   ```bash
   tofu init
   ```

3. Review the execution plan:

   ```bash
   tofu plan
   ```

4. Apply the configuration:

   ```bash
   tofu apply
   ```

5. Note the outputs for use in other OpenTofu configurations:

   ```bash
   tofu output
   ```

## Important Notes

* The S3 bucket name must be globally unique across all AWS accounts
* The configuration includes `prevent_destroy` lifecycle rule for the S3 bucket
* All resources are tagged according to the `tags` variable in `terraform.tfvars`
* The S3 bucket has versioning enabled for state file history
* Server-side encryption is enabled by default
* Public access to the S3 bucket is completely blocked

## Outputs

The following outputs are available after applying the configuration:
* `s3_bucket_name` - Name of the created S3 bucket
* `s3_bucket_arn` - ARN of the created S3 bucket
* `dynamodb_table_name` - Name of the created DynamoDB table
* `dynamodb_table_arn` - ARN of the created DynamoDB table

## OpenTofu Documentation

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.88.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.1 |

### Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.terraform_locks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [random_string.bucket_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | AWS Access Key | `string` | n/a | yes |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Prefix for S3 bucket name. Will be concatenated with random suffix | `string` | n/a | yes |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | Name of the DynamoDB table that will be used for state locking. Prevents concurrent modifications to the Terraform state | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region where the resources will be created | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | AWS Secret Key | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags to be applied to all resources | `map(string)` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_prefix"></a> [bucket\_prefix](#output\_bucket\_prefix) | The prefix used in the S3 bucket name |
| <a name="output_bucket_suffix"></a> [bucket\_suffix](#output\_bucket\_suffix) | The generated suffix used in the S3 bucket name |
| <a name="output_dynamodb_table_arn"></a> [dynamodb\_table\_arn](#output\_dynamodb\_table\_arn) | The ARN of the DynamoDB table used for Terraform state locking |
| <a name="output_dynamodb_table_name"></a> [dynamodb\_table\_name](#output\_dynamodb\_table\_name) | The name of the DynamoDB table used for Terraform state locking |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The ARN of the S3 bucket used for storing Terraform state files |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | The name of the S3 bucket used for storing Terraform state files |
<!-- END_TF_DOCS -->
