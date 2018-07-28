variable "servicebus_name" {
  type        = "string"
  description = "Input your unique Azure service bus name"
}

variable "queue_name" {
  type        = "string"
  description = "Input your queue_name"
  default     = "audit_queue"
}
