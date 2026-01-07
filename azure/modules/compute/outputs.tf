output "vm_id" {
  description = "Virtual Machine ID (for IAM scope)"
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.this.name
}
