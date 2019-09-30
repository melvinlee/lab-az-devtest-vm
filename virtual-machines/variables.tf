variable "name" {
  type        = "string"
  description = "Name of the dev lab."
  default     = "my-devlab"
}

variable "location" {
  type        = "string"
  description = "Location of the azure resource group."
  default     = "southeastasia"
}

variable "vm_size" {
  type        = "string"
  description = "virtual machine size"
  default     = "Standard_D4s_v3"
}

variable "image" {
  type = map(string)
  description = "To provision vm from an Azure Platform Image"
  default = {
    publisher = "microsoftvisualstudio"
    offer     = "visualstudio2019latest"
    sku       = "vs-2019-comm-latest-win10-n"
    version   = "latest"
  }
}

variable "admin_username" {
  type        = "string"
  description = "(Required) OS admin name for remote access."
}

variable "admin_password" {
  type        = "string"
  description = "(Required) OS admin password for remote access."
}

variable "boot_diagnostics" {
  description = "(Optional) Enable or Disable boot diagnostics"
  default     = "true"
}
