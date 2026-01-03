variable "bucket_name" {
  description = "Name of the AWS bucket for Terraform remote state"
  type        = string
  default     = "tfstate-aws-vm-foundation-dev"
}

variable "region" {
  description = "Bucket region"
  type        = string
  default     = "eu-north-1"
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  type        = string
}
