# Generate random suffix for globally unique bucket name
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  bucket_name = "${var.bucket_prefix}-${random_string.bucket_suffix.result}"
}
