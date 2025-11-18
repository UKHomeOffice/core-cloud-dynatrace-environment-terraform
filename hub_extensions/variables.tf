variable "tenant_vars" {
  type = any
}

variable "extension_name" {
  description = "Name of the Dynatrace hub extension"
  type        = string
}

variable "enabled" {
  description = "Enable or disable the extension"
  type        = bool
  default     = true
}

variable "description" {
  description = "Description for the Dynatrace hub extension config"
  type        = string
}

variable "management_zone" {
  description = "Management Zone this configuration will be scoped to (optional)"
  type        = string
  default     = null
}

variable "host_group" {
  description = "The host group this configuration will be scoped to (optional)"
  type        = string
  default     = null
}

variable "host" {
  description = "The host this configuration will be scoped to (optional)"
  default     = null
}
variable "active_gate_group" {
  description = "The active gate group this configuration will be scope to (optional)"
  default     = null
}

variable "extn_version" {
  description = "Version for the Dynatrace hub extension config"
  type        = string
}

variable "featureSets" {
  description = "List of feature sets for the Dynatrace extension"
  type        = list(any)
}

variable "activationTags" {
  type        = list(string)
  description = "List of activationTags to apply to this extension"
  # Expected format for tag: "[PROVIDER]key: value", e.g., "[AWS]dynatrace: true"
}
