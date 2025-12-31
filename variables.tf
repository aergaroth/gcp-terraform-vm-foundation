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
