variable "location" {
  description = "Azure region"
  type        = string
}

variable "admin_object_ids" {
  description = "Azure AD object IDs allowed to login to VMs"
  type        = list(string)
}

variable "env" {
  description = "Environment name (e.g. dev, stage, prod)"
  type        = string
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "project" {
  description = "Project name"
  type        = string
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

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}

variable "vm_login_principal_ids" {
  description = "Azure AD object IDs allowed to login to VM"
  type        = list(string)
}

variable "bootstrap_ssh_public_key" {
  description = "Dummy SSH key required by Azure provider"
  type        = string
}


variable "bastion_subnet_cidr" {
  description = "CIDR for Azure Bastion subnet"
  type        = string
}
