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
  description = "Management Zone this configuration will be defined for"
  type        = string
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
  type = list(object({
    tag = string
  }))
  description = "List of activationTags to apply to this extension"
  # Expected format for tag: "[PROVIDER]key: value", e.g., "[AWS]dynatrace: true"
  default = [{
    tag = "[AWS]dynatrace: true"
  }]
}
