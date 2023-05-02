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

# azurerm_private_dns_resolver_inbound_endpoint
output "private_dns_resolver_inbound_endpoint_ids" {
  description = "The IDs of the Private DNS Resolver Inbound Endpoints."
  value       = module.defaults.private_dns_resolver_inbound_endpoint_ids
}

# azurerm_private_dns_resolver_outbound_endpoint
output "private_dns_resolver_outbound_endpoint_ids" {
  description = "The IDs of the Private DNS Resolver Outbound Endpoints."
  value       = module.defaults.private_dns_resolver_outbound_endpoint_ids
}
