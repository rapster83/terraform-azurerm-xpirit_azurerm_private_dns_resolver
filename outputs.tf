# azurerm_resource_group
output "resource_group_id" {
  description = "The ID of the resource group (RG)."
  value       = try(azurerm_resource_group.this[0].id, null)
}

output "resource_group_name" {
  description = "The name of the resource group (RG)."
  value       = try(azurerm_resource_group.this[0].name, null)
}

# azurerm_private_dns_resolver
output "private_dns_resolver_id" {
  description = "The ID of the DNS Resolver."
  value       = try(azurerm_private_dns_resolver.this[0].id, null)
}
