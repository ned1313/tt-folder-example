provider "azurerm" {
  features {}
  use_oidc = true
}

variable "prefix" {
  type        = string
  description = "(Optional) The prefix which should be used for all resources in this example. Defaults to burrito."
  default     = "burrito"
}

variable "location" {
  type        = string
  description = "(Optional) The Azure Region in which all resources in this example should be created. Defaults to East US."
  default     = "eastus"
}

variable "environment" {
  type        = string
  description = "(Required) The environment in which all resources in this example should be created."
}

resource "azurerm_resource_group" "main" {
  location = var.location
  name     = "${var.prefix}-${var.environment}-folder"

  tags = {
    environment = var.environment
  }
}