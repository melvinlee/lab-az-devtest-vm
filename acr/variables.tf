##################################################################################
# VARIABLES
##################################################################################
variable "resource_group_name" {
  type        = "string"
  description = "Name of the azure resource group."
  default     = "container-registry-rg"
}

variable "acr_name" {
  type = "string"
  description = "Name of the azure container registry"
  default = "myacr349"
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