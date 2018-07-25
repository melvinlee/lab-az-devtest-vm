variable "vm_size" {
  type        = "string"
  description = "virtual machine size"
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
