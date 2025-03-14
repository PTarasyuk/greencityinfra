terraform {
  backend "s3" {
    assume_role = {
      role_arn = "arn:aws:iam::${var.account_id}:role/tf-admin"
    }
    bucket = "greencity-terraform-state-9791"
    key = "infra/terraform.tfstate"
    region = var.region
    dynamodb_table = "greencity-terraform-state-locks"
    encrypt = true
  }
}
