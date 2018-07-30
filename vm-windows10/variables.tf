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

variable "vm_size" {
  type        = "string"
  description = "virtual machine size"
  default     = "Standard_D4s_v3"
}

variable "vm_hostname" {
  description = "local name of the VM"
  default     = "myvm"
}

variable "admin_username" {
  type        = "string"
  description = "OS admin name"
}

variable "admin_password" {
  type        = "string"
  description = "OS admin password"
}

variable "boot_diagnostics" {
  description = "(Optional) Enable or Disable boot diagnostics"
  default     = "true"
}
