# global
example_location = "westeurope"
example_tags = {
  creator    = "Xpirit Germany GmbH"
  department = "Core Infrastructure"
}

# azurerm_resource_group
resource_group_name = "rg-example-hubvnet"

# azurerm_private_dns_resolver
private_dns_resolver_name = "pdnsr-example-hub"

# azurerm_private_dns_resolver_inbound_endpoint
private_dns_resolver_inbound_endpoints = {
  f8719193-6f3b-4426-82b4-b981f73f9c10 = {
    private_dns_resolver_id = null
    ip_configurations = {
      aa327091-dfcd-4411-b4c1-f9a06f7ccc5f = {
        private_ip_allocation_method = "Dynamic"
        subnet_id                    = null
        subnet_name                  = "InboundDnsSubnet01"
      },
    }
  },
  a3ad5af8-ecb9-4db6-b5b3-f4e1b9a64a99 = {
    private_dns_resolver_id = null
    ip_configurations = {
      aa327091-dfcd-4411-b4c1-f9a06f7ccc5f = {
        private_ip_allocation_method = "Dynamic"
        subnet_id                    = null
        subnet_name                  = "InboundDnsSubnet02"
      },
    }
  }
}

# azurerm_private_dns_resolver_outbound_endpoint
private_dns_resolver_outbound_endpoints = {
  de4f4b14-943f-4d9e-ac23-56f5478bd129 = {
    private_dns_resolver_id = null
    subnet_id               = null
    subnet_name             = "OutboundDnsSubnet01"
  },
  c322efaf-3138-45aa-a8eb-e94fa7522cc4 = {
    private_dns_resolver_id = null
    subnet_id               = null
    subnet_name             = "OutboundDnsSubnet02"
  },
  d600e046-7b12-4579-94d3-01b83e6ddd6c = {
    private_dns_resolver_id = null
    subnet_id               = null
    subnet_name             = "OutboundDnsSubnet03"
  },
}
