resource "azurerm_role_assignment" "vm_login" {
  for_each = toset(var.principal_ids)

  scope                = var.scope_id
  role_definition_name = var.role_name
  principal_id         = each.value
  principal_type       = "User"
}
