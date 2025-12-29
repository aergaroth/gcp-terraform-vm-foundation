variable "instance_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "zone" {
  type = string
}

variable "subnet" {
  description = "Subnetwork self_link or name"
  type        = string
}

variable "service_account_email" {
  type = string
}

# variable "ssh_username" {
#   type = string
# }

# variable "ssh_public_key" {
#   type = string
# }
