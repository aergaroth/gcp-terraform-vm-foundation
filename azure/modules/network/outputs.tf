output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_id" {
  value = azurerm_subnet.this.id
}

output "nsg_id" {
  value = azurerm_network_security_group.this.id
}

output "bastion_subnet_id" {
  description = "Subnet ID for Azure Bastion"
  value       = azurerm_subnet.bastion.id
}
