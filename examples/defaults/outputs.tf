# azurerm_resource_group
output "resource_group_id" {
  description = "The ID of the resource group (RG)."
  value       = module.defaults.resource_group_id
}

output "resource_group_name" {
  description = "The ID of the resource group (RG)."
  value       = module.defaults.resource_group_name
}

# azurerm_private_dns_resolver
output "private_dns_resolver_id" {
  description = "The ID of the DNS Resolver."
  value       = module.defaults.private_dns_resolver_id
}
