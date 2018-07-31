##################################################################################
# VARIABLES
##################################################################################
variable "resource_group_name" {
  type        = "string"
  description = "Name of the azure resource group."
  default     = "devlab-services"
}

variable "resource_group_location" {
  type        = "string"
  description = "Location of the azure resource group."
  default     = "southeastasia"
}

variable "compute_database_name" {
  type        = "string"
  description = "Name of Compute database."
  default     = "ComputeDB"
}

variable "audit_database_name" {
  type        = "string"
  description = "Name of Audit database."
  default     = "AuditDB"
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
  default     = "Passw0rd123!"
}

variable "resources_id" {
  type        = "string"
  description = "Name of the resource id."
  default     = "devlab"
}
