variable "zone_name" {
  type = string
}

#variable "zone_vars" {
#  type = any
#}


variable "zone_vars" {
  type = object({
    description = optional(string)
    legacy_id = optional(string)

    rules = optional(map(object({
        enabled = bool
        type = string
        entity_selector = optional(string, "")
        attribute_rule = optional(object({
          azure_to_pgpropagation = optional(bool)
          azure_to_service_propagation = optional(bool)
          custom_device_group_to_custom_device_propagation = optional(bool)
          host_to_pgpropagation = optional(bool)
          pg_to_host_propagation = optional(bool)
          pg_to_service_propagation = optional(bool)
          service_to_host_propagation = optional(bool)
          service_to_pgpropagation = optional(bool)
          entity_type = string
          attribute_conditions = object({
            condition = object({
              key = string
              operator = string
              case_sensitive = optional(bool)
              dynamic_key = optional(string)
              dynamic_key_source = optional(string)
              entity_id = optional(string)
              enum_value = optional(string)
              integer_value = optional(number)
              string_value = optional(string)
              tag = optional(string)
            })
          })
        }))
        dimension_rule = optional(object({
          applies_to = string
          dimension_conditions = optional(object({
            condition = object({
              condition_type = string
              rule_matcher = string
              value = string
              key = optional(string)
            })
          }))
        }))
      })))
    })
}
