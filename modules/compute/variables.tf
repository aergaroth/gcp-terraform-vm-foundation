variable "instances" {
  type = map(object({
    instance_type = string
  }))
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "instance_profile_name" {
  type = string
}

variable "aws_az" {
  type = string
}
