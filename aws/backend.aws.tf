# Example backend configuration (for reference only).
# Actual values must be provided during `terraform init`.

#terraform {
#  backend "s3" {
#    bucket         = "tfstate-aws-vm-foundation-dev"
#    key            = "env/dev/terraform.tfstate"
#    region         = "eu-north-1"
#    dynamodb_table = "terraform-locks"
#    encrypt        = true
#    profile        = var.aws_profile
#  }
#}


terraform {
  backend "s3" {}
}
