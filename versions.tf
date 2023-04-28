terraform {
  required_version = "> 1.1, <= 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.53.0"
    }
  }
}
