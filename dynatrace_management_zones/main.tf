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

  # Each rule in rules_list becomes a rule block
  rules {
    dynamic "rule" {
      for_each = local.rules_list

      content {
        type            = rule.value.type
        enabled         = rule.value.enabled
        entity_selector = try(rule.value.entity_selector, null)

        # ATTRIBUTE RULE (optional, only one)
        dynamic "attribute_rule" {
          for_each = rule.value.attribute_rule != null ? [rule.value.attribute_rule] : []

          content {
            entity_type = attribute_rule.value.entity_type

            # propagation flags
            azure_to_pgpropagation                           = try(attribute_rule.value.azure_to_pgpropagation, null)
            azure_to_service_propagation                     = try(attribute_rule.value.azure_to_service_propagation, null)
            custom_device_group_to_custom_device_propagation = try(attribute_rule.value.custom_device_group_to_custom_device_propagation, null)
            host_to_pgpropagation                            = try(attribute_rule.value.host_to_pgpropagation, null)
            pg_to_host_propagation                           = try(attribute_rule.value.pg_to_host_propagation, null)
            pg_to_service_propagation                        = try(attribute_rule.value.pg_to_service_propagation, null)
            service_to_host_propagation                      = try(attribute_rule.value.service_to_host_propagation, null)
            service_to_pgpropagation                         = try(attribute_rule.value.service_to_pgpropagation, null)

            # attribute_conditions block
            attribute_conditions {
              dynamic "condition" {
                for_each = attribute_rule.value.attribute_conditions

                content {
                  key                = condition.value.key
                  operator           = condition.value.operator
                  case_sensitive     = try(condition.value.case_sensitive, null)
                  dynamic_key        = try(condition.value.dynamic_key, null)
                  dynamic_key_source = try(condition.value.dynamic_key_source, null)
                  entity_id          = try(condition.value.entity_id, null)
                  enum_value         = try(condition.value.enum_value, null)
                  integer_value      = try(condition.value.integer_value, null)
                  string_value       = try(condition.value.string_value, null)
                  tag                = try(condition.value.tag, null)
                }
              }
            }
          }
        }

        # DIMENSION RULE (optional, only one)
        dynamic "dimension_rule" {
          for_each = rule.value.dimension_rule != null ? [rule.value.dimension_rule] : []

          content {
            applies_to = try(dimension_rule.value.applies_to, "ANY")

            dimension_conditions {
              condition {
                condition_type = dimension_rule.value.dimension_conditions.condition.condition_type
                rule_matcher   = dimension_rule.value.dimension_conditions.condition.rule_matcher
                value          = dimension_rule.value.dimension_conditions.condition.value
                key            = try(dimension_rule.value.dimension_conditions.condition.key, null)
              }
            }
          }
        }
      }
    }
  }
}
