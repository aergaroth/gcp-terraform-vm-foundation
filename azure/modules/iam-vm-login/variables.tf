variable "scope_id" {
  description = "Scope for RBAC assignment (RG or VM ID)"
  type        = string
}

variable "principal_ids" {
  description = "Azure AD object IDs allowed to login to VMs"
  type        = list(string)
}

variable "role_name" {
  description = "RBAC role name"
  type        = string
  default     = "Virtual Machine User Login"
}
