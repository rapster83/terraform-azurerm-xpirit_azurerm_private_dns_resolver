# azurerm_private_dns_resolver
variable "create_private_dns_resolver" {
  description = "Enable or disable private dns resolver creation."
  type        = bool
  default     = false
}

variable "private_dns_resolver_name" {
  description = "Specifies the name which should be used for this Private DNS Resolver. Changing this forces a new Private DNS Resolver to be created."
  type        = string
  default     = null
}

variable "private_dns_resolver_virtual_network_id" {
  description = "The ID of the Virtual Network that is linked to the Private DNS Resolver. Changing this forces a new Private DNS Resolver to be created."
  type        = string
  default     = null
}

variable "private_dns_resolver_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

# azurerm_private_dns_resolver_inbound_endpoint
variable "private_dns_resolver_inbound_endpoints" {
  description = "Manages Private DNS Resolver Inbound Endpoints."
  type = map(object({
    private_dns_resolver_id = string
    ip_configurations = map(object({
      private_ip_allocation_method = string
      subnet_id                    = string
      subnet_name                  = string
    }))
  }))
  default = null
}

variable "private_dns_resolver_inbound_endpoint_subnets" {
  description = "A mapping of subnets, used for the endpoint creation."
  type        = map(string)
  default     = null
}

variable "private_dns_resolver_inbound_endpoint_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

# azurerm_private_dns_resolver_outbound_endpoint
variable "private_dns_resolver_outbound_endpoints" {
  description = "Manages Private DNS Resolver Outbound Endpoints."
  type = map(object({
    private_dns_resolver_id = string
    subnet_id               = string
  }))
  default = null
}

variable "private_dns_resolver_outbound_endpoint_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
