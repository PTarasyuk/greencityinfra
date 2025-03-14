# AWS Access Key
variable "access_key" {
  type        = string
  description = "AWS Access Key"
}

# AWS Secret Key
variable "secret_key" {
  type        = string
  description = "AWS Secret Key"
}

# AWS Region where the resources will be created
variable "region" {
  type        = string
  description = "AWS Region where the resources will be created"
}

# Name of the S3 bucket that will store the Terraform state
# Must be globally unique across all AWS accounts
# variable "bucket_name" {
#   type        = string
#   description = "Name of the S3 bucket for Terraform state. Must be globally unique across all AWS accounts"
# }

# Name of the DynamoDB table that will be used for state locking
# Prevents concurrent modifications to the Terraform state
variable "dynamodb_table_name" {
  type        = string
  description = "Name of the DynamoDB table that will be used for state locking. Prevents concurrent modifications to the Terraform state"
}

variable "bucket_prefix" {
  type        = string
  description = "Prefix for S3 bucket name. Will be concatenated with random suffix"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to be applied to all resources"
}
