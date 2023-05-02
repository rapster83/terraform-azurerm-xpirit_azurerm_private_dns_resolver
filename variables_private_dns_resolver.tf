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
