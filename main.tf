resource "azurerm_resource_group" "this" {
  count    = var.create_resource_group ? 1 : 0
  location = var.module_location
  name     = var.resource_group_name

  tags = merge(
    var.module_tags,
    var.resource_group_tags
  )
}

resource "azurerm_private_dns_resolver" "this" {
  count               = var.create_private_dns_resolver ? 1 : 0
  name                = var.private_dns_resolver_name
  location            = var.module_location
  resource_group_name = try(azurerm_resource_group.this[0].name, var.resource_group_name)
  virtual_network_id  = var.private_dns_resolver_virtual_network_id

  tags = merge(
    var.module_tags,
    var.private_dns_resolver_tags
  )
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "this" {
  for_each                = var.private_dns_resolver_inbound_endpoints != null ? var.private_dns_resolver_inbound_endpoints : {}
  name                    = each.key
  location                = var.module_location
  private_dns_resolver_id = try(azurerm_private_dns_resolver.this[0].id, each.value.private_dns_resolver_id)

  dynamic "ip_configurations" {
    for_each = each.value.ip_configurations != null ? each.value.ip_configurations : {}

    content {
      private_ip_allocation_method = ip_configurations.value.private_ip_allocation_method
      subnet_id                    = ip_configurations.value.subnet_id != null ? ip_configurations.value.subnet_id : var.private_dns_resolver_inbound_endpoint_subnets[ip_configurations.value.subnet_name]
    }
  }

  tags = merge(
    var.module_tags,
    var.private_dns_resolver_inbound_endpoint_tags
  )
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "this" {
  for_each                = var.private_dns_resolver_outbound_endpoints != null ? var.private_dns_resolver_outbound_endpoints : {}
  name                    = each.key
  location                = var.module_location
  private_dns_resolver_id = try(azurerm_private_dns_resolver.this[0].id, each.value.private_dns_resolver_id)
  subnet_id               = each.value.subnet_id != null ? each.value.subnet_id : var.private_dns_resolver_outbound_endpoint_subnets[each.value.subnet_name]

  tags = merge(
    var.module_tags,
    var.private_dns_resolver_outbound_endpoint_tags
  )
}
