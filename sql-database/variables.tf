# variable "client_id" {
#   type        = "string"
#   description = "Client ID"
# }

# variable "client_secret" {
#   type        = "string"
#   description = "Client secret."
# }

# variable "subscription_id" {
#   type        = "string"
#   description = "Subscription id."
# }

# variable "tenant_id" {
#   type        = "string"
#   description = "Tenant id."
# }

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

variable "database_name" {
  type        = "string"
  description = "Name of the database."
}

variable "environment" {
  type        = "string"
  description = "dev, test or production."
  default     = "dev"
}

variable "admin_login" {
  type        = "string"
  description = "User name for db login."
}

variable "admin_password" {
  type        = "string"
  description = "Password for db login."
}
