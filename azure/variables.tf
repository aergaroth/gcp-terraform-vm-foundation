variable "location" {
  description = "Azure region"
  type        = string
}

variable "admin_object_ids" {
  description = "Azure AD object IDs allowed to login to VMs"
  type        = list(string)
}

variable "environment" {
  type = string
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "project" {
  type = string
}


variable "name" {
  description = "Base name for Azure resources"
  type        = string
}

variable "vnet_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = string
}


variable "instances" {
  type = map(object({
    size = string
    zone = string
  }))
}
