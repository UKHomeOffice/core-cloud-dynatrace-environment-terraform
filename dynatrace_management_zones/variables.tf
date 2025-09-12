variable "zone_name" {
  type        = string
  description = "Name of the management zone"
}

variable "zone_vars" {
  type = object({
    description            = optional(string)
    legacy_id              = optional(string)
    env_name               = optional(string, "")
    project_id             = optional(string, "")
    service_id             = optional(string, "")
    tag_name               = optional(string, "")
    tag_env_name           = optional(string, "")
    tag_value              = optional(string, "")
    webapp_prefix          = optional(string, "")
    # k8s_cluster_value      = optional(string, "")
    k8s_cluster_name_begins_with       = optional(string, "")
    k8s_cluster_name      = optional(string, "")
    k8s_namespace         = optional(string, "")
    host_group_begins_with = optional(string, "")
    aws_account_id         = optional(string,"")
    project_service        = optional(string, "")
    pg_to_host_propagation = optional(bool, false)
    pg_to_service_propagation = optional(bool, false) 
    rules_templates        = list(string)
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
        applies_to = optional(string, "ANY")
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
}

