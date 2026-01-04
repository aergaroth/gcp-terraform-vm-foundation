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

# backend.aws.tf
terraform {
  backend "s3" {}
}
