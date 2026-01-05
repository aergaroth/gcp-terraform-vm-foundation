resource "azurerm_role_assignment" "vm_login" {
  scope                = var.scope_id
  role_definition_name = var.role_name
  principal_id         = var.principal_id
}
