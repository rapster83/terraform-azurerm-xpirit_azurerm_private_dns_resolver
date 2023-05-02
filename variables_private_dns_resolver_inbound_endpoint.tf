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
  description = "A mapping of subnets, used for the inbound endpoint creation."
  type        = map(string)
  default     = null
}

variable "private_dns_resolver_inbound_endpoint_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
