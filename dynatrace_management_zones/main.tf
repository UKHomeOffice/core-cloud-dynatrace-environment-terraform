terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_management_zone_v2" "management_zone" {
# Corresponds to the object structure defined in the variables.tf
# One zone entity, consisting of 0 or 1 'rules' blocks - which in turn consist of 1 or more individual 'rule' definitions

  name = var.zone_name
  description = var.zone_vars.description
  legacy_id = var.zone_vars.legacy_id
  dynamic "rules" {
    for_each = var.zone_vars.rules != null ? var.zone_vars.rules[*] : []
    # Create a 'rules' block if defined in the config.yaml, else skips all following dynamic blocks
    content {
      dynamic "rule" {
        for_each = var.zone_vars.rules
        # Creates one rule definition per entry inside the 'rules' section of the MZ config (name not used)
        content {
            type = rule.value.type
            enabled = rule.value.enabled
            entity_selector = rule.value.entity_selector

          dynamic "attribute_rule" {
            for_each = rule.value.attribute_rule[*]
            # Creates an attribute rule block with conditions as defined - either this or dimension_rule
            content {
              azure_to_pgpropagation = attribute_rule.value.azure_to_pgpropagation
              azure_to_service_propagation = attribute_rule.value.azure_to_service_propagation
              custom_device_group_to_custom_device_propagation = attribute_rule.value.custom_device_group_to_custom_device_propagation
              host_to_pgpropagation = attribute_rule.value.host_to_pgpropagation
              pg_to_host_propagation = attribute_rule.value.pg_to_host_propagation
              pg_to_service_propagation = attribute_rule.value.pg_to_service_propagation
              service_to_host_propagation = attribute_rule.value.service_to_host_propagation
              service_to_pgpropagation = attribute_rule.value.service_to_pgpropagation
              entity_type = attribute_rule.value.entity_type
              
              attribute_conditions {
                dynamic "condition" {
                  for_each = try(attribute_rule.value.attribute_conditions, [])
                  content {
                      key                 = condition.value.key
                      operator            = condition.value.operator
                      case_sensitive      = try(condition.value.case_sensitive, null)
                      dynamic_key         = try(condition.value.dynamic_key, null)
                      dynamic_key_source  = try(condition.value.dynamic_key_source, null)
                      entity_id           = try(condition.value.entity_id, null)
                      enum_value          = try(condition.value.enum_value, null)
                      integer_value       = try(condition.value.integer_value, null)
                      string_value        = try(condition.value.string_value, null)
                      tag                 = try(condition.value.tag, null)
                  }
                }
              }
            }
          }

          dynamic "dimension_rule" {
            for_each = rule.value.dimension_rule[*]
            # Creates a dimension rule block with conditions as defined - either this or attribute_rule
            content {
              applies_to = dimension_rule.value.applies_to
              dimension_conditions {
                condition {
                  condition_type = dimension_rule.value.dimension_conditions.condition.condition_type
                  rule_matcher = dimension_rule.value.dimension_conditions.condition.rule_matcher
                  value = dimension_rule.value.dimension_conditions.condition.value
                  key = dimension_rule.value.dimension_conditions.condition.key
                }
              }
            }
          }

        }
      }
    }
  }
}


output "zone_var_output"{
  value = "${var.zone_vars}"
}
