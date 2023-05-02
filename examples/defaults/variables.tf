# global
variable "example_location" {
  description = "Specified the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "example_tags" {
  description = "A mapping of tags which should be assigned to all resources."
  type        = map(string)
  default     = null
}

# azurerm_resource_group
variable "create_resource_group" {
  description = "Enable or disable RG creation."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name which should be used for this RG. Changing this forces a new RG to be created."
  type        = string
}

# azurerm_private_dns_resolver
variable "create_private_dns_resolver" {
  description = "Enable or disable private dns resolver creation."
  type        = bool
  default     = true
}

variable "private_dns_resolver_name" {
  description = "Specifies the name which should be used for this Private DNS Resolver. Changing this forces a new Private DNS Resolver to be created."
  type        = string
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

# azurerm_private_dns_resolver_outbound_endpoint
variable "private_dns_resolver_outbound_endpoints" {
  description = "Manages Private DNS Resolver Outbound Endpoints."
  type = map(object({
    private_dns_resolver_id = string
    subnet_id               = string
    subnet_name             = string
  }))
  default = null
}
