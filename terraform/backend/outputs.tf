output "bucket_prefix" {
  value       = var.bucket_prefix
  description = "The prefix used in the S3 bucket name"
}

output "bucket_suffix" {
  value       = random_string.bucket_suffix.result
  description = "The generated suffix used in the S3 bucket name"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.terraform_state.id
  description = "The name of the S3 bucket used for storing Terraform state files"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.id
  description = "The name of the DynamoDB table used for Terraform state locking"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket used for storing Terraform state files"
}

output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.terraform_locks.arn
  description = "The ARN of the DynamoDB table used for Terraform state locking"
}
