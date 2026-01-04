variable "name" {
  description = "Name prefix for SSM access policy"
  type        = string
}

variable "attach_to_role_arn" {
  description = "IAM role ARN to attach the policy to (optional)"
  type        = string
  default     = null
}

variable "attach_to_user_name" {
  description = "IAM user name to attach the policy to (optional)"
  type        = string
  default     = null
}
