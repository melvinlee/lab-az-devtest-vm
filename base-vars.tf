variable "resource_group_name" {
  type        = "string"
  description = "Name of the azure resource group."
  default     = "devlab-rg"
}

variable "resource_group_location" {
  type        = "string"
  description = "Location of the azure resource group."
  default     = "southeastasia"
}

variable "environment" {
  type        = "string"
  description = "dev, test or production."
  default     = "dev"
}