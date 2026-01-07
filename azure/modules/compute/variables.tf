variable "name" {
  description = "VM name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID from network module"
  type        = string
}

variable "nsg_id" {
  description = "Network Security Group ID from network module"
  type        = string
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Local admin username (AAD login)"
  type        = string
  default     = "azureuser"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "bootstrap_ssh_public_key" {
  description = "Bootstrap SSH key required by Azure (not used for access)"
  type        = string
}
