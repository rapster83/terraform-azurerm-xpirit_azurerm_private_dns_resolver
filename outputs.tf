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

# azurerm_private_dns_resolver_inbound_endpoint
output "private_dns_resolver_inbound_endpoint_ids" {
  description = "The IDs of the Private DNS Resolver Inbound Endpoints."
  value       = { for inbound_endpoint in azurerm_private_dns_resolver_inbound_endpoint.this : inbound_endpoint.name => inbound_endpoint.id }
}

# azurerm_private_dns_resolver_outbound_endpoint
output "private_dns_resolver_outbound_endpoint_ids" {
  description = "The IDs of the Private DNS Resolver Outbound Endpoints."
  value       = { for outbound_endpoint in azurerm_private_dns_resolver_outbound_endpoint.this : outbound_endpoint.name => outbound_endpoint.id }
}
