variable "zone_name" {
# The name of the management zone - retrieved as the identifying key within the 'management_zones' block of the config.yaml
  type = string
}

variable "zone_vars" {
#This variable consists of the content of the per-named Management Zone key from the config.yaml
#The provided values are structured into an object, containing further nested objects, as below
  type = object({
    description = optional(string)
    legacy_id = optional(string)

    rules = optional(map(object({
    # The below attributes are contained in an individual 'rule' block created by the main TF file
    # The 'rule' itself is dynamic and not defined as an object here, for cases where 'rules' are not defined
    # ('Rules' are optional, but when set must contain at least one 'rule' block)
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
