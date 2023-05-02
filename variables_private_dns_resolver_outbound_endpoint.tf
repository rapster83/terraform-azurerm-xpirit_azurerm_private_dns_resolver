variable "private_dns_resolver_outbound_endpoints" {
  description = "Manages Private DNS Resolver Outbound Endpoints."
  type = map(object({
    private_dns_resolver_id = string
    subnet_id               = string
    subnet_name             = string
  }))
  default = null
}

variable "private_dns_resolver_outbound_endpoint_subnets" {
  description = "A mapping of subnets, used for the outbound endpoint creation."
  type        = map(string)
  default     = null
}

variable "private_dns_resolver_outbound_endpoint_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
