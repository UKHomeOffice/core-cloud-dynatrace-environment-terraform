variable "autotag_name" {
  type        = string
  description = "The name of the AutoTag as it will appear in Dynatrace."
}

variable "project_id" {
  type        = string
  description = "Project identifier used for tag generation or template interpolation."
}

variable "default_autotag_rules" {
  type        = list(string)
  default     = []
  description = "Default AutoTag rule template names to apply if none are specified in the tenant configuration."
}

variable "autotag_vars" {
  type = object({
    description             = optional(string)
    autotag_rules_templates = optional(list(string))
    tenant_exclusive_rules  = optional(map(object({
      type                = string
      enabled             = bool
      value_format        = optional(string)
      value_normalization = string

      entity_selector = optional(string)

      attribute_rule = optional(object({
        entity_type = string

        azure_to_pgpropagation      = optional(bool)
        azure_to_service_propagation = optional(bool)
        host_to_pgpropagation       = optional(bool)
        pg_to_host_propagation      = optional(bool)
        pg_to_service_propagation   = optional(bool)
        service_to_host_propagation = optional(bool)
        service_to_pgpropagation    = optional(bool)

        conditions = list(object({
          key                = string
          operator           = string
          case_sensitive     = optional(bool)
          dynamic_key        = optional(string)
          dynamic_key_source = optional(string)
          entity_id          = optional(string)
          enum_value         = optional(string)
          integer_value      = optional(number)
          string_value       = optional(string)
          tag                = optional(string)
        }))
      }))
    })))
  })
  description = "Tenant-specific AutoTag configuration overrides."
  default     = {}
}