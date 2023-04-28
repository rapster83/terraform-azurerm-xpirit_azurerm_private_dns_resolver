resource "random_string" "this" {
  length    = 4
  lower     = true
  min_lower = 4
  special   = false
}

resource "azurerm_resource_group" "this" {
  name     = "rg-example-pdnsr-${random_string.this.result}"
  location = var.example_location
}

resource "azurerm_virtual_network" "this" {
  name                = "vnet-example-pdnsr-${random_string.this.result}"
  location            = var.example_location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = ["10.50.0.0/16"]
}

resource "azurerm_subnet" "this_in01" {
  name                 = "InboundDnsSubnet01"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.50.0.0/24"]

  delegation {
    name = "b482904c-062d-4f96-8f82-3a3af27ca228"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_subnet" "this_in02" {
  name                 = "InboundDnsSubnet02"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.50.1.0/24"]

  delegation {
    name = "d9385722-d6c6-40bf-afd4-22ae5244046e"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_subnet" "this_out01" {
  name                 = "OutboundDnsSubnet01"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.50.2.0/24"]
}

resource "azurerm_subnet" "this_out02" {
  name                 = "OutboundDnsSubnet02"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.50.3.0/24"]
}

module "defaults" {
  source = "../.."

  # global
  module_location = var.example_location
  module_tags     = var.example_tags

  # azurerm_resource_group
  create_resource_group = var.create_resource_group
  resource_group_name   = "${var.resource_group_name}-${random_string.this.result}"

  # azurerm_private_dns_resolver
  create_private_dns_resolver             = var.create_private_dns_resolver
  private_dns_resolver_name               = "${var.private_dns_resolver_name}-${random_string.this.result}"
  private_dns_resolver_virtual_network_id = azurerm_virtual_network.this.id

  # azurerm_private_dns_resolver_inbound_endpoint
  private_dns_resolver_inbound_endpoints = var.private_dns_resolver_inbound_endpoints
  private_dns_resolver_inbound_endpoint_subnets = {
    "${azurerm_subnet.this_in01.name}" = "${azurerm_subnet.this_in01.id}"
    "${azurerm_subnet.this_in02.name}" = "${azurerm_subnet.this_in02.id}"
  }

  # # azurerm_private_dns_resolver_outbound_endpoint
  # private_dns_resolver_outbound_endpoints = var.private_dns_resolver_outbound_endpoints

  # # azurerm_private_dns_resolver_dns_forwarding_ruleset
  # create_private_dns_resolver_dns_forwarding_ruleset = var.create_private_dns_resolver_dns_forwarding_ruleset
  # private_dns_resolver_dns_forwarding_ruleset_name = "${var.private_dns_resolver_dns_forwarding_ruleset_name}-${random_string.this.result}"

  # # azurerm_private_dns_resolver_forwarding_rule
  # private_dns_resolver_forwarding_rules = var.private_dns_resolver_forwarding_rules

  # # azurerm_private_dns_resolver_virtual_network_link

}
