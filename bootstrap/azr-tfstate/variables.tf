variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for Terraform state"
}

variable "storage_account_name" {
  type        = string
  description = "Globally unique storage account name"
}

variable "container_name" {
  type        = string
  description = "Blob container for Terraform state"
  default     = "tfstate"
}
