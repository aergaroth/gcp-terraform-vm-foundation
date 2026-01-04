
variable "instances" {
  type = map(object({
    machine_type = string
    zone         = string
  }))
}


variable "subnet" {
  description = "Subnetwork self_link or name"
  type        = string
}

variable "service_account_email" {
  type = string
}

