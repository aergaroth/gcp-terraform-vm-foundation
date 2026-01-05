variable "resource_group_name" {
  description = "Resource group for Terraform state"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name for Terraform state"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

