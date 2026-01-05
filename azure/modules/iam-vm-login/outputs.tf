output "role_assignment_ids" {
  description = "Role assignment IDs per principal"
  value = {
    for k, v in azurerm_role_assignment.vm_login :
    k => v.id
  }
}
