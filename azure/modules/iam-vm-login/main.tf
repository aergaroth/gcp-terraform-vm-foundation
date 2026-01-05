resource "azurerm_role_assignment" "vm_login" {
  for_each = toset(var.principal_ids)

  scope                = var.scope_id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = each.value
}
