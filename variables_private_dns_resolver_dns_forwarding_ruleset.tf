# azurerm_private_dns_resolver_dns_forwarding_ruleset
variable "create_private_dns_resolver_dns_forwarding_ruleset" {
  description = "Enable or disable private DNS resolver forwarding ruleset creation."
  type        = bool
  default     = false
}

variable "private_dns_resolver_dns_forwarding_ruleset_name" {
  description = "Specifies the name which should be used for this Private DNS Resolver Dns Forwarding Ruleset. Changing this forces a new Private DNS Resolver Dns Forwarding Ruleset to be created."
  type        = string
  default     = null
}

variable "private_dns_resolver_dns_forwarding_ruleset_outbound_endpoint_ids" {
  description = "The list of IDs of the Private DNS Resolver Outbound Endpoint that is linked to the Private DNS Resolver Dns Forwarding Ruleset."
  type        = list(string)
  default     = null
}

variable "private_dns_resolver_dns_forwarding_ruleset_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

# azurerm_private_dns_resolver_forwarding_rule
variable "private_dns_resolver_forwarding_rules" {
  description = "Manage Private DNS Resolver Forwarding Rules."
  type = map(object({
    dns_forwarding_ruleset_id = string
    domain_name               = string
    enabled                   = bool
    metadata                  = map(string)
    target_dns_servers = map(object({
      ip_address = string
      port       = number
    }))
  }))
  default = null
}

# azurerm_private_dns_resolver_virtual_network_link
variable "private_dns_resolver_virtual_network_links" {
  description = "Manages Private DNS Resolver Virtual Network Links."
  type = map(object({
    dns_forwarding_ruleset_id = string
    virtual_network_id        = string
    metadata                  = map(string)
  }))
  default = null
}
