variable "scope_id" {
  description = "Scope for RBAC assignment (RG or VM ID)"
  type        = string
}

variable "principal_id" {
  description = "Entra ID object ID (user or group)"
  type        = string
}

variable "role_name" {
  description = "RBAC role name"
  type        = string
  default     = "Virtual Machine User Login"
}
