variable "module_location" {
  description = "The Azure region where the resource group (RG) should exist. Changing this forces a new RG to be created."
  type        = string
}

variable "module_tags" {
  description = "A mapping of tags which should be assigned to all resources of the module."
  type        = map(string)
  default     = null
}
