variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "instances" {
  description = "EC2 instances definition"
  type = map(object({
    instance_type = string
    az            = string
  }))
}
