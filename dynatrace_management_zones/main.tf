terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_management_zone_v2" "management_zone" {
  name        = var.zone_name
  description = try(var.zone_vars.description, "Management zone for ${var.zone_name}")
  legacy_id   = try(var.zone_vars.legacy_id, null)

  # Top-level rules block
  rules {
    dynamic "rule" {
      for_each = length(local.zone_rules_sorted) > 0 ? local.zone_rules_sorted : [
        {
          type    = "DEFAULT"
          enabled = true
        }
      ]
      content {
        type            = rule.value.type
        enabled         = try(rule.value.enabled, true)
        entity_selector = try(rule.value.entity_selector, null)

        # Attribute rules
        dynamic "attribute_rule" {
          for_each = lookup(rule.value, "attribute_rule", [])
          content {
            entity_type = lookup(attribute_rule.value, "entity_type", null)

            azure_to_pgpropagation                           = lookup(attribute_rule.value, "azure_to_pgpropagation", false)
            azure_to_service_propagation                     = lookup(attribute_rule.value, "azure_to_service_propagation", false)
            custom_device_group_to_custom_device_propagation = lookup(attribute_rule.value, "custom_device_group_to_custom_device_propagation", false)
            host_to_pgpropagation                            = lookup(attribute_rule.value, "host_to_pgpropagation", false)
            pg_to_host_propagation                           = lookup(attribute_rule.value, "pg_to_host_propagation", false)
            pg_to_service_propagation                        = lookup(attribute_rule.value, "pg_to_service_propagation", false)
            service_to_host_propagation                      = lookup(attribute_rule.value, "service_to_host_propagation", false)
            service_to_pgpropagation                         = lookup(attribute_rule.value, "service_to_pgpropagation", false)

            # Attribute conditions
            attribute_conditions {
              dynamic "condition" {
                for_each = lookup(attribute_rule.value, "attribute_conditions", [])
                content {
                  key                = condition.value.key
                  operator           = condition.value.operator
                  case_sensitive     = try(condition.value.case_sensitive, false)
                  dynamic_key        = try(condition.value.dynamic_key, null)
                  dynamic_key_source = try(condition.value.dynamic_key_source, null)
                  entity_id          = try(condition.value.entity_id, null)
                  enum_value         = try(condition.value.enum_value, null)
                  integer_value      = try(condition.value.integer_value, 0)
                  string_value       = try(condition.value.string_value, null)
                  tag                = try(condition.value.tag, null)
                }
              }
            }
          }
        }

        # Dimension rules
        dynamic "dimension_rule" {
          for_each = lookup(rule.value, "dimension_rule", [])
          content {
            applies_to = dimension_rule.value.applies_to

            dynamic "dimension_conditions" {
              for_each = lookup(dimension_rule.value, "dimension_conditions", [])
              content {
                dynamic "condition" {
                  for_each = lookup(dimension_conditions.value, "condition", [])
                  content {
                    condition_type = try(condition.value.condition_type, null)
                    rule_matcher   = try(condition.value.rule_matcher, null)
                    value          = try(condition.value.value, null)
                    key            = try(condition.value.key, null)
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

output "zone_var_output" {
  value = local.zone_rules_sorted
}
