# Create an S3 bucket to store Terraform state files
# This bucket will maintain the state of all infrastructure resources
resource "aws_s3_bucket" "terraform_state" {
  bucket = local.bucket_name  # Using generated unique name

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }

  tags = merge(var.tags, {
    Name = local.bucket_name
  })
}

# Enable versioning on the S3 bucket
# This will maintain a history of all state files, allowing you to recover previous states
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption for the S3 bucket
# This ensures that all state files are encrypted at rest using AES-256 encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block all public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
