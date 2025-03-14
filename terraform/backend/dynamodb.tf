# Create a DynamoDB table for Terraform state locking
# This prevents multiple users from applying changes simultaneously
resource "aws_dynamodb_table" "terraform_locks" {
  # Name of the DynamoDB table
  name = var.dynamodb_table_name

  # Use pay-per-request billing mode to minimize costs
  billing_mode = "PAY_PER_REQUEST"

  # The hash key is required and must be named 'LockID'
  hash_key = "LockID"

  # Define the schema for the table
  attribute {
    name = "LockID"
    type = "S"  # String type
  }

  # Add tags for better resource management
  tags = merge(var.tags, {
    Name = var.dynamodb_table_name
  })
}
