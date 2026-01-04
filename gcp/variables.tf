variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
}

variable "allowed_ssh_cidrs" {
  type = list(string)
}

variable "service_account_name" {
  type = string
}


variable "instances" {
  description = "Map of compute instances"
  type = map(object({
    machine_type = string
    zone         = string
  }))
}
