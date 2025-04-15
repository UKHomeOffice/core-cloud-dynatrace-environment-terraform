variable "connection_name" {
  type = string
}

variable "tenant_vars" {
  type = any
}

variable "default_services" {
  type = any
}

variable "activegate_deployment_type" {
  description = "Determines whether ActiveGate runs on-premises or as SaaS"
  type        = string
  default     = "on_prem"

  validation {
    condition     = contains(["on_prem", "saas"], var.activegate_deployment_type)
    error_message = "ActiveGate deployment type must be either 'on_prem' or 'saas'"
  }
}
