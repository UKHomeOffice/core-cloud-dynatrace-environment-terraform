variable "zone_name" {
  type        = string
  description = "Name of the management zone"
}

variable "zone_vars" {
  type = object({
    description           = optional(string)
    legacy_id            = optional(string)
    project_id           = optional(string)
    host_prefix          = optional(string)
    webapp_prefix        = optional(string)
    k8s_cluster_operator = optional(string)
    k8s_cluster_value    = optional(string)
    rules_templates      = list(string)
    tenant_exclusive_rules = optional(map(object({
      enabled = bool
      type    = string
      entity_selector = optional(string)
      attribute_rule = optional(object({
        azure_to_pgpropagation                  = optional(bool)
        azure_to_service_propagation            = optional(bool)
        custom_device_group_to_custom_device_propagation = optional(bool)
        host_to_pgpropagation                   = optional(bool)
        pg_to_host_propagation                  = optional(bool)
        pg_to_service_propagation               = optional(bool)
        service_to_host_propagation             = optional(bool)
        service_to_pgpropagation                = optional(bool)
        entity_type = string
        attribute_conditions = list(object({
          key                 = string
          operator            = string
          case_sensitive      = optional(bool)
          dynamic_key         = optional(string)
          dynamic_key_source  = optional(string)
          entity_id           = optional(string)
          enum_value          = optional(string)
          integer_value       = optional(number)
          string_value        = optional(string)
          tag                 = optional(string)
        }))
      }))
      dimension_rule = optional(object({
        applies_to = string
        dimension_conditions = optional(object({
          condition = object({
            condition_type = string
            rule_matcher   = string
            value          = string
            key            = optional(string)
          })
        }))
      }))
    })))
  })
  description = "Configuration for Dynatrace management zone"
}

