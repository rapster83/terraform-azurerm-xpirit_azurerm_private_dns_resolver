variable "create_resource_group" {
  description = "Enable or disable RG creation."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "The name which should be used for this RG. Changing this forces a new RG to be created."
  type        = string
}

variable "resource_group_tags" {
  description = "A mapping of tags which should be assigned to the RG."
  type        = map(string)
  default     = null
}
