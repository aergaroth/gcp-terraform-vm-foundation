variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  type        = string
}

variable "aws_az" {
  description = "AWS Availability Zone"
  type        = string
}

variable "instances" {
  description = "EC2 instances definition"
  type = map(object({
    instance_type = string
  }))
}

variable "aws_user_name" {
  type        = string
  description = "IAM user name for SSM access"
  default     = null
}

variable "aws_human_role_arn" {
  type        = string
  description = "IAM role ARN for SSM access"
  default     = null
}
